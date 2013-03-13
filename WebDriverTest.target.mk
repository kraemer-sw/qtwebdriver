# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := WebDriverTest
DEFS_Default := 

# Flags passed to all source files.
CFLAGS_Default := $(RPM_OPT_FLAGS)

# Flags passed to only C files.
CFLAGS_C_Default := $(RPM_OPT_FLAGS)

# Flags passed to only C++ files.
CFLAGS_CC_Default := $(RPM_OPT_FLAGS)

INCS_Default := -Iinc \
	-I/home/vv/Qt/4.8.4/include

OBJS := $(obj).target/$(TARGET)/src/Test/main.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(obj).target/libWebDriver.a

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE)) $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE)) $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Default := 

LIBS := -L/home/vv/Qt/4.8.4/lib/ \
	-lQtWebKit \
	-lQtNetwork \
	-lQtGui \
	-lQtCore \
	-lpthread \
	-lrt \
	-ldl

$(builddir)/WebDriverTest: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(builddir)/WebDriverTest: LIBS := $(LIBS)
$(builddir)/WebDriverTest: LD_INPUTS := $(OBJS) $(obj).target/libWebDriver.a
$(builddir)/WebDriverTest: TOOLSET := $(TOOLSET)
$(builddir)/WebDriverTest: $(OBJS) $(obj).target/libWebDriver.a FORCE_DO_CMD
	$(call do_cmd,link)

all_deps += $(builddir)/WebDriverTest
# Add target alias
.PHONY: WebDriverTest
WebDriverTest: $(builddir)/WebDriverTest

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/WebDriverTest

