require 'irb/completion'

IRB.conf[:USE_READLINE] = true
IRB.conf[:AUTO_INDENT]  = false

module Readline
    module History
        LOG = "#{ENV['HOME']}/.irb-log"

        @log = ""

        def self.append_log line
            @log << "#{line}\n"
        end

        def self.write_log
            File.open(LOG, 'wb') { |f| f << "#{@log}\n" }
        end

        def self.start_session_log
            append_log("// SESSION START #{Time.now}\n")

            at_exit {
                append_log("\n// SESSION END #{Time.now}")
                write_log
            }
        end
    end

    alias :old_readline :readline
    def readline(*args)
        ln = old_readline(*args)
        begin
            History.append_log(ln)
        rescue
        end
        ln
    end
end

Readline::History.start_session_log
