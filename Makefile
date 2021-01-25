.PHONY: examples resume

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
OUT_DIR = output

MY_RESUME_DIR = resume
MY_RESUME_SRCS = $(shell find $(MY_RESUME_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

resume: ryan-resume.tex $(MY_RESUME_SRCS)
	$(CC) -output-directory=$(OUT_DIR) $<

clean:
	rm -rf \
	$(EXAMPLES_DIR)/*.aux \
	$(EXAMPLES_DIR)/*.log \
	$(EXAMPLES_DIR)/*.out \
	$(EXAMPLES_DIR)/*.gz \
	$(OUT_DIR)/*.aux \
	$(OUT_DIR)/*.log \
	$(OUT_DIR)/*.out \
	$(OUT_DIR)/*.gz \
	*.aux \
	*.log \
	*.out \
	*.gz
