Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9635C2E7;
	Fri,  2 Jun 2023 09:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685697263; x=1717233263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BdiLtrwXFdiiE7na0cGJkkbGiZCP52EixX0rwpHvuzU=;
  b=Q/RVPwDbz25BYy6fm+abKiXHrLkbRdsvxDJPfYHNdM720m0JALfoQkZT
   m4AOS6fxdhVZ+TfEeg7djkzV9iMZTwz4lKW6spLKTeOW7cbIGXi3fovoN
   TOXlfXIFLAK7ZiJ2MMALiy+nrq/t+iehLSCu8Crv3Fhn8q2cLUYVMzQ8c
   2kp48LGaZj9AVf4HtHkC35V1astS7Njpy8UlwpyTAmfzXQ1gU5U9DNYSt
   7TjuWJh5a50b6cy3lhSUaLkFfY0/dBsx1S+eaO9RLzhhLCiMhJnshamog
   2KxDnZ3N/X9eXqXA21UfW2zQvwol2N2hv8EeDEpw7FCG+KL+Nq3INjg35
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358255441"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="358255441"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 02:14:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740766311"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="740766311"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Jun 2023 02:14:21 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q50rU-0000HJ-2K;
	Fri, 02 Jun 2023 09:14:20 +0000
Date: Fri, 2 Jun 2023 17:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl-qtg 16/26] lib/fw_table.c:29:39: error: expected ';'
 after top level declarator
Message-ID: <202306021732.31Cuyr7l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   d149ac9ae1abedde6933ea16e12a44b965bb1384
commit: 5d09ce6212f35827d5ca6c271d70ac8bb9b5eb8a [16/26] cxl: Add callback to parse the DSMAS subtables from CDAT
config: arm-randconfig-r014-20230601 (https://download.01.org/0day-ci/archive/20230602/202306021732.31Cuyr7l-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=5d09ce6212f35827d5ca6c271d70ac8bb9b5eb8a
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 5d09ce6212f35827d5ca6c271d70ac8bb9b5eb8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306021732.31Cuyr7l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/fw_table.c:29:39: error: expected ';' after top level declarator
   static unsigned long __init_or_acpilib
                                         ^
                                         ;
   lib/fw_table.c:47:39: error: expected ';' after top level declarator
   static unsigned long __init_or_acpilib
                                         ^
                                         ;
   lib/fw_table.c:67:39: error: expected ';' after top level declarator
   static unsigned long __init_or_acpilib
                                         ^
                                         ;
>> lib/fw_table.c:85:32: error: redefinition of '__init_or_acpilib' with a different type: 'enum acpi_subtable_type' vs 'unsigned long'
   static enum acpi_subtable_type __init_or_acpilib
                                  ^
   lib/fw_table.c:67:22: note: previous definition is here
   static unsigned long __init_or_acpilib
                        ^
   lib/fw_table.c:85:49: error: expected ';' after top level declarator
   static enum acpi_subtable_type __init_or_acpilib
                                                   ^
                                                   ;
   lib/fw_table.c:99:39: error: expected ';' after top level declarator
   static unsigned long __init_or_acpilib
                                         ^
                                         ;
   lib/fw_table.c:112:8: error: unknown type name '__init_or_acpilib'
   static __init_or_acpilib bool has_handler(struct acpi_subtable_proc *proc)
          ^
   lib/fw_table.c:112:30: error: expected ';' after top level declarator
   static __init_or_acpilib bool has_handler(struct acpi_subtable_proc *proc)
                                ^
                                ;
   lib/fw_table.c:117:8: error: unknown type name '__init_or_acpilib'
   static __init_or_acpilib int call_handler(struct acpi_subtable_proc *proc,
          ^
>> lib/fw_table.c:151:5: error: redefinition of '__init_or_acpilib' with a different type: 'int' vs 'unsigned long'
   int __init_or_acpilib
       ^
   lib/fw_table.c:99:22: note: previous definition is here
   static unsigned long __init_or_acpilib
                        ^
   lib/fw_table.c:151:22: error: expected ';' after top level declarator
   int __init_or_acpilib
                        ^
                        ;
   11 errors generated.


vim +29 lib/fw_table.c

773808188a9583 Dave Jiang 2023-05-11   28  
773808188a9583 Dave Jiang 2023-05-11  @29  static unsigned long __init_or_acpilib
773808188a9583 Dave Jiang 2023-05-11   30  acpi_get_entry_type(struct acpi_subtable_entry *entry)
773808188a9583 Dave Jiang 2023-05-11   31  {
773808188a9583 Dave Jiang 2023-05-11   32  	switch (entry->type) {
773808188a9583 Dave Jiang 2023-05-11   33  	case ACPI_SUBTABLE_COMMON:
773808188a9583 Dave Jiang 2023-05-11   34  		return entry->hdr->common.type;
773808188a9583 Dave Jiang 2023-05-11   35  	case ACPI_SUBTABLE_HMAT:
773808188a9583 Dave Jiang 2023-05-11   36  		return entry->hdr->hmat.type;
773808188a9583 Dave Jiang 2023-05-11   37  	case ACPI_SUBTABLE_PRMT:
773808188a9583 Dave Jiang 2023-05-11   38  		return 0;
773808188a9583 Dave Jiang 2023-05-11   39  	case ACPI_SUBTABLE_CEDT:
773808188a9583 Dave Jiang 2023-05-11   40  		return entry->hdr->cedt.type;
a4f8e943725bf7 Dave Jiang 2023-05-24   41  	case CDAT_SUBTABLE:
a4f8e943725bf7 Dave Jiang 2023-05-24   42  		return entry->hdr->cdat.type;
773808188a9583 Dave Jiang 2023-05-11   43  	}
773808188a9583 Dave Jiang 2023-05-11   44  	return 0;
773808188a9583 Dave Jiang 2023-05-11   45  }
773808188a9583 Dave Jiang 2023-05-11   46  
773808188a9583 Dave Jiang 2023-05-11  @47  static unsigned long __init_or_acpilib
773808188a9583 Dave Jiang 2023-05-11   48  acpi_get_entry_length(struct acpi_subtable_entry *entry)
773808188a9583 Dave Jiang 2023-05-11   49  {
773808188a9583 Dave Jiang 2023-05-11   50  	switch (entry->type) {
773808188a9583 Dave Jiang 2023-05-11   51  	case ACPI_SUBTABLE_COMMON:
773808188a9583 Dave Jiang 2023-05-11   52  		return entry->hdr->common.length;
773808188a9583 Dave Jiang 2023-05-11   53  	case ACPI_SUBTABLE_HMAT:
773808188a9583 Dave Jiang 2023-05-11   54  		return entry->hdr->hmat.length;
773808188a9583 Dave Jiang 2023-05-11   55  	case ACPI_SUBTABLE_PRMT:
773808188a9583 Dave Jiang 2023-05-11   56  		return entry->hdr->prmt.length;
773808188a9583 Dave Jiang 2023-05-11   57  	case ACPI_SUBTABLE_CEDT:
773808188a9583 Dave Jiang 2023-05-11   58  		return entry->hdr->cedt.length;
a4f8e943725bf7 Dave Jiang 2023-05-24   59  	case CDAT_SUBTABLE:
a4f8e943725bf7 Dave Jiang 2023-05-24   60  		__le16 length = (__force __le16)entry->hdr->cdat.length;
a4f8e943725bf7 Dave Jiang 2023-05-24   61  
a4f8e943725bf7 Dave Jiang 2023-05-24   62  		return le16_to_cpu(length);
773808188a9583 Dave Jiang 2023-05-11   63  	}
773808188a9583 Dave Jiang 2023-05-11   64  	return 0;
773808188a9583 Dave Jiang 2023-05-11   65  }
773808188a9583 Dave Jiang 2023-05-11   66  
773808188a9583 Dave Jiang 2023-05-11   67  static unsigned long __init_or_acpilib
773808188a9583 Dave Jiang 2023-05-11   68  acpi_get_subtable_header_length(struct acpi_subtable_entry *entry)
773808188a9583 Dave Jiang 2023-05-11   69  {
773808188a9583 Dave Jiang 2023-05-11   70  	switch (entry->type) {
773808188a9583 Dave Jiang 2023-05-11   71  	case ACPI_SUBTABLE_COMMON:
773808188a9583 Dave Jiang 2023-05-11   72  		return sizeof(entry->hdr->common);
773808188a9583 Dave Jiang 2023-05-11   73  	case ACPI_SUBTABLE_HMAT:
773808188a9583 Dave Jiang 2023-05-11   74  		return sizeof(entry->hdr->hmat);
773808188a9583 Dave Jiang 2023-05-11   75  	case ACPI_SUBTABLE_PRMT:
773808188a9583 Dave Jiang 2023-05-11   76  		return sizeof(entry->hdr->prmt);
773808188a9583 Dave Jiang 2023-05-11   77  	case ACPI_SUBTABLE_CEDT:
773808188a9583 Dave Jiang 2023-05-11   78  		return sizeof(entry->hdr->cedt);
a4f8e943725bf7 Dave Jiang 2023-05-24   79  	case CDAT_SUBTABLE:
a4f8e943725bf7 Dave Jiang 2023-05-24   80  		return sizeof(entry->hdr->cdat);
773808188a9583 Dave Jiang 2023-05-11   81  	}
773808188a9583 Dave Jiang 2023-05-11   82  	return 0;
773808188a9583 Dave Jiang 2023-05-11   83  }
773808188a9583 Dave Jiang 2023-05-11   84  
773808188a9583 Dave Jiang 2023-05-11  @85  static enum acpi_subtable_type __init_or_acpilib
773808188a9583 Dave Jiang 2023-05-11   86  acpi_get_subtable_type(char *id)
773808188a9583 Dave Jiang 2023-05-11   87  {
773808188a9583 Dave Jiang 2023-05-11   88  	if (strncmp(id, ACPI_SIG_HMAT, 4) == 0)
773808188a9583 Dave Jiang 2023-05-11   89  		return ACPI_SUBTABLE_HMAT;
773808188a9583 Dave Jiang 2023-05-11   90  	if (strncmp(id, ACPI_SIG_PRMT, 4) == 0)
773808188a9583 Dave Jiang 2023-05-11   91  		return ACPI_SUBTABLE_PRMT;
773808188a9583 Dave Jiang 2023-05-11   92  	if (strncmp(id, ACPI_SIG_CEDT, 4) == 0)
773808188a9583 Dave Jiang 2023-05-11   93  		return ACPI_SUBTABLE_CEDT;
a4f8e943725bf7 Dave Jiang 2023-05-24   94  	if (strncmp(id, ACPI_SIG_CDAT, 4) == 0)
a4f8e943725bf7 Dave Jiang 2023-05-24   95  		return CDAT_SUBTABLE;
773808188a9583 Dave Jiang 2023-05-11   96  	return ACPI_SUBTABLE_COMMON;
773808188a9583 Dave Jiang 2023-05-11   97  }
773808188a9583 Dave Jiang 2023-05-11   98  
a4f8e943725bf7 Dave Jiang 2023-05-24   99  static unsigned long __init_or_acpilib
a4f8e943725bf7 Dave Jiang 2023-05-24  100  acpi_table_get_length(enum acpi_subtable_type type,
a4f8e943725bf7 Dave Jiang 2023-05-24  101  		      union fw_table_header *header)
a4f8e943725bf7 Dave Jiang 2023-05-24  102  {
a4f8e943725bf7 Dave Jiang 2023-05-24  103  	if (type == CDAT_SUBTABLE) {
a4f8e943725bf7 Dave Jiang 2023-05-24  104  		__le32 length = (__force __le32)header->cdat.length;
a4f8e943725bf7 Dave Jiang 2023-05-24  105  
a4f8e943725bf7 Dave Jiang 2023-05-24  106  		return le32_to_cpu(length);
a4f8e943725bf7 Dave Jiang 2023-05-24  107  	}
a4f8e943725bf7 Dave Jiang 2023-05-24  108  
a4f8e943725bf7 Dave Jiang 2023-05-24  109  	return header->acpi.length;
a4f8e943725bf7 Dave Jiang 2023-05-24  110  }
a4f8e943725bf7 Dave Jiang 2023-05-24  111  
773808188a9583 Dave Jiang 2023-05-11 @112  static __init_or_acpilib bool has_handler(struct acpi_subtable_proc *proc)
773808188a9583 Dave Jiang 2023-05-11  113  {
773808188a9583 Dave Jiang 2023-05-11  114  	return proc->handler || proc->handler_arg;
773808188a9583 Dave Jiang 2023-05-11  115  }
773808188a9583 Dave Jiang 2023-05-11  116  
773808188a9583 Dave Jiang 2023-05-11  117  static __init_or_acpilib int call_handler(struct acpi_subtable_proc *proc,
773808188a9583 Dave Jiang 2023-05-11  118  					  union acpi_subtable_headers *hdr,
773808188a9583 Dave Jiang 2023-05-11  119  					  unsigned long end)
773808188a9583 Dave Jiang 2023-05-11  120  {
773808188a9583 Dave Jiang 2023-05-11  121  	if (proc->handler)
773808188a9583 Dave Jiang 2023-05-11  122  		return proc->handler(hdr, end);
773808188a9583 Dave Jiang 2023-05-11  123  	if (proc->handler_arg)
773808188a9583 Dave Jiang 2023-05-11  124  		return proc->handler_arg(hdr, proc->arg, end);
773808188a9583 Dave Jiang 2023-05-11  125  	return -EINVAL;
773808188a9583 Dave Jiang 2023-05-11  126  }
773808188a9583 Dave Jiang 2023-05-11  127  
773808188a9583 Dave Jiang 2023-05-11  128  /**
773808188a9583 Dave Jiang 2023-05-11  129   * acpi_parse_entries_array - for each proc_num find a suitable subtable
773808188a9583 Dave Jiang 2023-05-11  130   *
773808188a9583 Dave Jiang 2023-05-11  131   * @id: table id (for debugging purposes)
773808188a9583 Dave Jiang 2023-05-11  132   * @table_size: size of the root table
773808188a9583 Dave Jiang 2023-05-11  133   * @table_header: where does the table start?
773808188a9583 Dave Jiang 2023-05-11  134   * @proc: array of acpi_subtable_proc struct containing entry id
773808188a9583 Dave Jiang 2023-05-11  135   *        and associated handler with it
773808188a9583 Dave Jiang 2023-05-11  136   * @proc_num: how big proc is?
773808188a9583 Dave Jiang 2023-05-11  137   * @max_entries: how many entries can we process?
773808188a9583 Dave Jiang 2023-05-11  138   *
773808188a9583 Dave Jiang 2023-05-11  139   * For each proc_num find a subtable with proc->id and run proc->handler
773808188a9583 Dave Jiang 2023-05-11  140   * on it. Assumption is that there's only single handler for particular
773808188a9583 Dave Jiang 2023-05-11  141   * entry id.
773808188a9583 Dave Jiang 2023-05-11  142   *
773808188a9583 Dave Jiang 2023-05-11  143   * The table_size is not the size of the complete ACPI table (the length
773808188a9583 Dave Jiang 2023-05-11  144   * field in the header struct), but only the size of the root table; i.e.,
773808188a9583 Dave Jiang 2023-05-11  145   * the offset from the very first byte of the complete ACPI table, to the
773808188a9583 Dave Jiang 2023-05-11  146   * first byte of the very first subtable.
773808188a9583 Dave Jiang 2023-05-11  147   *
773808188a9583 Dave Jiang 2023-05-11  148   * On success returns sum of all matching entries for all proc handlers.
773808188a9583 Dave Jiang 2023-05-11  149   * Otherwise, -ENODEV or -EINVAL is returned.
773808188a9583 Dave Jiang 2023-05-11  150   */
773808188a9583 Dave Jiang 2023-05-11 @151  int __init_or_acpilib
773808188a9583 Dave Jiang 2023-05-11  152  acpi_parse_entries_array(char *id, unsigned long table_size,
a4f8e943725bf7 Dave Jiang 2023-05-24  153  			 union fw_table_header *table_header,
773808188a9583 Dave Jiang 2023-05-11  154  			 struct acpi_subtable_proc *proc,
773808188a9583 Dave Jiang 2023-05-11  155  			 int proc_num, unsigned int max_entries)
773808188a9583 Dave Jiang 2023-05-11  156  {
773808188a9583 Dave Jiang 2023-05-11  157  	unsigned long table_end, subtable_len, entry_len;
773808188a9583 Dave Jiang 2023-05-11  158  	struct acpi_subtable_entry entry;
a4f8e943725bf7 Dave Jiang 2023-05-24  159  	enum acpi_subtable_type type;
773808188a9583 Dave Jiang 2023-05-11  160  	int count = 0;
773808188a9583 Dave Jiang 2023-05-11  161  	int errs = 0;
773808188a9583 Dave Jiang 2023-05-11  162  	int i;
773808188a9583 Dave Jiang 2023-05-11  163  
a4f8e943725bf7 Dave Jiang 2023-05-24  164  	type = acpi_get_subtable_type(id);
a4f8e943725bf7 Dave Jiang 2023-05-24  165  	table_end = (unsigned long)table_header +
a4f8e943725bf7 Dave Jiang 2023-05-24  166  		    acpi_table_get_length(type, table_header);
773808188a9583 Dave Jiang 2023-05-11  167  
773808188a9583 Dave Jiang 2023-05-11  168  	/* Parse all entries looking for a match. */
773808188a9583 Dave Jiang 2023-05-11  169  
a4f8e943725bf7 Dave Jiang 2023-05-24  170  	entry.type = type;
773808188a9583 Dave Jiang 2023-05-11  171  	entry.hdr = (union acpi_subtable_headers *)
773808188a9583 Dave Jiang 2023-05-11  172  	    ((unsigned long)table_header + table_size);
773808188a9583 Dave Jiang 2023-05-11  173  	subtable_len = acpi_get_subtable_header_length(&entry);
773808188a9583 Dave Jiang 2023-05-11  174  
773808188a9583 Dave Jiang 2023-05-11  175  	while (((unsigned long)entry.hdr) + subtable_len  < table_end) {
773808188a9583 Dave Jiang 2023-05-11  176  		if (max_entries && count >= max_entries)
773808188a9583 Dave Jiang 2023-05-11  177  			break;
773808188a9583 Dave Jiang 2023-05-11  178  
773808188a9583 Dave Jiang 2023-05-11  179  		for (i = 0; i < proc_num; i++) {
773808188a9583 Dave Jiang 2023-05-11  180  			if (acpi_get_entry_type(&entry) != proc[i].id)
773808188a9583 Dave Jiang 2023-05-11  181  				continue;
773808188a9583 Dave Jiang 2023-05-11  182  			if (!has_handler(&proc[i]) ||
773808188a9583 Dave Jiang 2023-05-11  183  			    (!errs &&
773808188a9583 Dave Jiang 2023-05-11  184  			     call_handler(&proc[i], entry.hdr, table_end))) {
773808188a9583 Dave Jiang 2023-05-11  185  				errs++;
773808188a9583 Dave Jiang 2023-05-11  186  				continue;
773808188a9583 Dave Jiang 2023-05-11  187  			}
773808188a9583 Dave Jiang 2023-05-11  188  
773808188a9583 Dave Jiang 2023-05-11  189  			proc[i].count++;
773808188a9583 Dave Jiang 2023-05-11  190  			break;
773808188a9583 Dave Jiang 2023-05-11  191  		}
773808188a9583 Dave Jiang 2023-05-11  192  		if (i != proc_num)
773808188a9583 Dave Jiang 2023-05-11  193  			count++;
773808188a9583 Dave Jiang 2023-05-11  194  
773808188a9583 Dave Jiang 2023-05-11  195  		/*
773808188a9583 Dave Jiang 2023-05-11  196  		 * If entry->length is 0, break from this loop to avoid
773808188a9583 Dave Jiang 2023-05-11  197  		 * infinite loop.
773808188a9583 Dave Jiang 2023-05-11  198  		 */
773808188a9583 Dave Jiang 2023-05-11  199  		entry_len = acpi_get_entry_length(&entry);
773808188a9583 Dave Jiang 2023-05-11  200  		if (entry_len == 0) {
773808188a9583 Dave Jiang 2023-05-11  201  			pr_err("[%4.4s:0x%02x] Invalid zero length\n", id, proc->id);
773808188a9583 Dave Jiang 2023-05-11  202  			return -EINVAL;
773808188a9583 Dave Jiang 2023-05-11  203  		}
773808188a9583 Dave Jiang 2023-05-11  204  
773808188a9583 Dave Jiang 2023-05-11  205  		entry.hdr = (union acpi_subtable_headers *)
773808188a9583 Dave Jiang 2023-05-11  206  		    ((unsigned long)entry.hdr + entry_len);
773808188a9583 Dave Jiang 2023-05-11  207  	}
773808188a9583 Dave Jiang 2023-05-11  208  
773808188a9583 Dave Jiang 2023-05-11  209  	if (max_entries && count > max_entries) {
773808188a9583 Dave Jiang 2023-05-11  210  		pr_warn("[%4.4s:0x%02x] found the maximum %i entries\n",
773808188a9583 Dave Jiang 2023-05-11  211  			id, proc->id, count);
773808188a9583 Dave Jiang 2023-05-11  212  	}
773808188a9583 Dave Jiang 2023-05-11  213  
773808188a9583 Dave Jiang 2023-05-11  214  	return errs ? -EINVAL : count;
773808188a9583 Dave Jiang 2023-05-11  215  }
773808188a9583 Dave Jiang 2023-05-11  216  EXPORT_SYMBOL_GPL(acpi_parse_entries_array);
a4f8e943725bf7 Dave Jiang 2023-05-24  217  

:::::: The code at line 29 was first introduced by commit
:::::: 773808188a9583e1e972862094c60a6ddc70f748 acpi: Move common tables helper functions to common lib

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Dave Jiang <dave.jiang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
