
all: compile

compile:
	test -d ebin || mkdir ebin
	erl -make
	cd priv && make

debug:
	erl -make
	cd priv && make debug

clean:
	rm -rf ./ebin/*.beam
	rm -rf ./ebin/*.so
	rm -rf ./*.beam

run:
	LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib erl -pa ./ebin -sname zerg

docs:
	erl -noshell -run edoc_run application "'drmaa'" '"."' '[{title, "Erlang binding for DRMAA C interface"}, {hidden, false}, {private, false}]' -s erlang halt
ex:
	LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib	./examples/run_job.erl
	LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib	./examples/wait_job.erl
	LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib	./examples/attrs.erl
	LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib	./examples/placeholders.erl
	LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib	./examples/job_ids.erl
	LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib	./examples/bulk_jobs.erl
	LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib	./examples/synchronize.erl
	LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib	./examples/sync_all.erl
	LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib	./examples/job_status.erl
