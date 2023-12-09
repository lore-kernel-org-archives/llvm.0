Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C0A1802A;
	Sat,  9 Dec 2023 18:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sb5TkkOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702146906; x=1733682906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=djHHmAftj9p50s0o3qa5eltA18Ttb159yPJkN8YgOP8=;
  b=Sb5TkkOxh/iy3UhenXz5C3bS0/eLNWOgICDt3DDCuIxWQ3qei/MstJKs
   V/1jot89s8llmdS/io5/QZFNK9AOvMJx1rTW+tKXg1IuPzpx/yIr3MRov
   iR2nsiZRIZBn39jHO6+vWaBgkPP5JtMv3ejNoKa7wHPCb5qkXz2Rrlacj
   p7ppOT8fO0nOZb5puP8qWRcR2bnN0PmTx8Z0J7F7MPqDwdXTWUU2T8Otq
   6N7ADy5KBl1Wf5vddx9eAAtBc4D4iUnJkMwkSobzgMN/hLV+bIguoEwes
   /4jEy0EpGBtBa661Vu7KY08E1Dn0YW+TLebC376RQFyzYn5vY3JXb8OwE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="384931662"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="384931662"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 10:35:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="842973120"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="842973120"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 09 Dec 2023 10:35:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC2AI-000FlF-0Z;
	Sat, 09 Dec 2023 18:35:02 +0000
Date: Sun, 10 Dec 2023 02:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl-hmem-report 9/23] lib/fw_table.c:29:39: error: expected
 ';' after top level declarator
Message-ID: <202312100233.nx1OELtr-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-hmem-report
head:   d097ef73f93c1f0d8098ecc5bbaf396ce09c75e2
commit: 42771b7cc480da076cded00909b9b7fde57d8928 [9/23] cxl: Add callback to parse the DSMAS subtables from CDAT
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231210/202312100233.nx1OELtr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312100233.nx1OELtr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312100233.nx1OELtr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> lib/fw_table.c:29:39: error: expected ';' after top level declarator
      29 | static unsigned long __init_or_acpilib
         |                                       ^
         |                                       ;
   lib/fw_table.c:47:39: error: expected ';' after top level declarator
      47 | static unsigned long __init_or_acpilib
         |                                       ^
         |                                       ;
   lib/fw_table.c:68:39: error: expected ';' after top level declarator
      68 | static unsigned long __init_or_acpilib
         |                                       ^
         |                                       ;
>> lib/fw_table.c:86:32: error: redefinition of '__init_or_acpilib' with a different type: 'enum acpi_subtable_type' vs 'unsigned long'
      86 | static enum acpi_subtable_type __init_or_acpilib
         |                                ^
   lib/fw_table.c:68:22: note: previous definition is here
      68 | static unsigned long __init_or_acpilib
         |                      ^
   lib/fw_table.c:86:49: error: expected ';' after top level declarator
      86 | static enum acpi_subtable_type __init_or_acpilib
         |                                                 ^
         |                                                 ;
   lib/fw_table.c:100:39: error: expected ';' after top level declarator
     100 | static unsigned long __init_or_acpilib
         |                                       ^
         |                                       ;
   lib/fw_table.c:113:8: error: unknown type name '__init_or_acpilib'
     113 | static __init_or_acpilib bool has_handler(struct acpi_subtable_proc *proc)
         |        ^
   lib/fw_table.c:113:30: error: expected ';' after top level declarator
     113 | static __init_or_acpilib bool has_handler(struct acpi_subtable_proc *proc)
         |                              ^
         |                              ;
   lib/fw_table.c:118:8: error: unknown type name '__init_or_acpilib'
     118 | static __init_or_acpilib int call_handler(struct acpi_subtable_proc *proc,
         |        ^
>> lib/fw_table.c:118:50: warning: declaration of 'struct acpi_subtable_proc' will not be visible outside of this function [-Wvisibility]
     118 | static __init_or_acpilib int call_handler(struct acpi_subtable_proc *proc,
         |                                                  ^
>> lib/fw_table.c:122:10: error: incomplete definition of type 'struct acpi_subtable_proc'
     122 |         if (proc->handler)
         |             ~~~~^
   lib/fw_table.c:118:50: note: forward declaration of 'struct acpi_subtable_proc'
     118 | static __init_or_acpilib int call_handler(struct acpi_subtable_proc *proc,
         |                                                  ^
   lib/fw_table.c:123:14: error: incomplete definition of type 'struct acpi_subtable_proc'
     123 |                 return proc->handler(hdr, end);
         |                        ~~~~^
   lib/fw_table.c:118:50: note: forward declaration of 'struct acpi_subtable_proc'
     118 | static __init_or_acpilib int call_handler(struct acpi_subtable_proc *proc,
         |                                                  ^
   lib/fw_table.c:124:10: error: incomplete definition of type 'struct acpi_subtable_proc'
     124 |         if (proc->handler_arg)
         |             ~~~~^
   lib/fw_table.c:118:50: note: forward declaration of 'struct acpi_subtable_proc'
     118 | static __init_or_acpilib int call_handler(struct acpi_subtable_proc *proc,
         |                                                  ^
   lib/fw_table.c:125:14: error: incomplete definition of type 'struct acpi_subtable_proc'
     125 |                 return proc->handler_arg(hdr, proc->arg, end);
         |                        ~~~~^
   lib/fw_table.c:118:50: note: forward declaration of 'struct acpi_subtable_proc'
     118 | static __init_or_acpilib int call_handler(struct acpi_subtable_proc *proc,
         |                                                  ^
   lib/fw_table.c:125:37: error: incomplete definition of type 'struct acpi_subtable_proc'
     125 |                 return proc->handler_arg(hdr, proc->arg, end);
         |                                               ~~~~^
   lib/fw_table.c:118:50: note: forward declaration of 'struct acpi_subtable_proc'
     118 | static __init_or_acpilib int call_handler(struct acpi_subtable_proc *proc,
         |                                                  ^
>> lib/fw_table.c:152:5: error: redefinition of '__init_or_acpilib' with a different type: 'int' vs 'unsigned long'
     152 | int __init_or_acpilib
         |     ^
   lib/fw_table.c:100:22: note: previous definition is here
     100 | static unsigned long __init_or_acpilib
         |                      ^
   lib/fw_table.c:152:22: error: expected ';' after top level declarator
     152 | int __init_or_acpilib
         |                      ^
         |                      ;
   lib/fw_table.c:219:8: error: unknown type name 'acpi_tbl_entry_handler_arg'
     219 |                      acpi_tbl_entry_handler_arg handler_arg, void *arg,
         |                      ^
>> lib/fw_table.c:222:28: error: variable has incomplete type 'struct acpi_subtable_proc'
     222 |         struct acpi_subtable_proc proc = {
         |                                   ^
   lib/fw_table.c:222:9: note: forward declaration of 'struct acpi_subtable_proc'
     222 |         struct acpi_subtable_proc proc = {
         |                ^
>> lib/fw_table.c:231:9: error: call to undeclared function 'acpi_parse_entries_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     231 |         return acpi_parse_entries_array(ACPI_SIG_CDAT,
         |                ^
   1 warning and 19 errors generated.


vim +29 lib/fw_table.c

a103f46633fdcd Dave Jiang 2023-10-12   28  
a103f46633fdcd Dave Jiang 2023-10-12  @29  static unsigned long __init_or_acpilib
a103f46633fdcd Dave Jiang 2023-10-12   30  acpi_get_entry_type(struct acpi_subtable_entry *entry)
a103f46633fdcd Dave Jiang 2023-10-12   31  {
a103f46633fdcd Dave Jiang 2023-10-12   32  	switch (entry->type) {
a103f46633fdcd Dave Jiang 2023-10-12   33  	case ACPI_SUBTABLE_COMMON:
a103f46633fdcd Dave Jiang 2023-10-12   34  		return entry->hdr->common.type;
a103f46633fdcd Dave Jiang 2023-10-12   35  	case ACPI_SUBTABLE_HMAT:
a103f46633fdcd Dave Jiang 2023-10-12   36  		return entry->hdr->hmat.type;
a103f46633fdcd Dave Jiang 2023-10-12   37  	case ACPI_SUBTABLE_PRMT:
a103f46633fdcd Dave Jiang 2023-10-12   38  		return 0;
a103f46633fdcd Dave Jiang 2023-10-12   39  	case ACPI_SUBTABLE_CEDT:
a103f46633fdcd Dave Jiang 2023-10-12   40  		return entry->hdr->cedt.type;
13b7d7a98b65d1 Dave Jiang 2023-05-24   41  	case CDAT_SUBTABLE:
13b7d7a98b65d1 Dave Jiang 2023-05-24   42  		return entry->hdr->cdat.type;
a103f46633fdcd Dave Jiang 2023-10-12   43  	}
a103f46633fdcd Dave Jiang 2023-10-12   44  	return 0;
a103f46633fdcd Dave Jiang 2023-10-12   45  }
a103f46633fdcd Dave Jiang 2023-10-12   46  
a103f46633fdcd Dave Jiang 2023-10-12  @47  static unsigned long __init_or_acpilib
a103f46633fdcd Dave Jiang 2023-10-12   48  acpi_get_entry_length(struct acpi_subtable_entry *entry)
a103f46633fdcd Dave Jiang 2023-10-12   49  {
a103f46633fdcd Dave Jiang 2023-10-12   50  	switch (entry->type) {
a103f46633fdcd Dave Jiang 2023-10-12   51  	case ACPI_SUBTABLE_COMMON:
a103f46633fdcd Dave Jiang 2023-10-12   52  		return entry->hdr->common.length;
a103f46633fdcd Dave Jiang 2023-10-12   53  	case ACPI_SUBTABLE_HMAT:
a103f46633fdcd Dave Jiang 2023-10-12   54  		return entry->hdr->hmat.length;
a103f46633fdcd Dave Jiang 2023-10-12   55  	case ACPI_SUBTABLE_PRMT:
a103f46633fdcd Dave Jiang 2023-10-12   56  		return entry->hdr->prmt.length;
a103f46633fdcd Dave Jiang 2023-10-12   57  	case ACPI_SUBTABLE_CEDT:
a103f46633fdcd Dave Jiang 2023-10-12   58  		return entry->hdr->cedt.length;
13b7d7a98b65d1 Dave Jiang 2023-05-24   59  	case CDAT_SUBTABLE: {
13b7d7a98b65d1 Dave Jiang 2023-05-24   60  		__le16 length = (__force __le16)entry->hdr->cdat.length;
13b7d7a98b65d1 Dave Jiang 2023-05-24   61  
13b7d7a98b65d1 Dave Jiang 2023-05-24   62  		return le16_to_cpu(length);
13b7d7a98b65d1 Dave Jiang 2023-05-24   63  	}
a103f46633fdcd Dave Jiang 2023-10-12   64  	}
a103f46633fdcd Dave Jiang 2023-10-12   65  	return 0;
a103f46633fdcd Dave Jiang 2023-10-12   66  }
a103f46633fdcd Dave Jiang 2023-10-12   67  
a103f46633fdcd Dave Jiang 2023-10-12   68  static unsigned long __init_or_acpilib
a103f46633fdcd Dave Jiang 2023-10-12   69  acpi_get_subtable_header_length(struct acpi_subtable_entry *entry)
a103f46633fdcd Dave Jiang 2023-10-12   70  {
a103f46633fdcd Dave Jiang 2023-10-12   71  	switch (entry->type) {
a103f46633fdcd Dave Jiang 2023-10-12   72  	case ACPI_SUBTABLE_COMMON:
a103f46633fdcd Dave Jiang 2023-10-12   73  		return sizeof(entry->hdr->common);
a103f46633fdcd Dave Jiang 2023-10-12   74  	case ACPI_SUBTABLE_HMAT:
a103f46633fdcd Dave Jiang 2023-10-12   75  		return sizeof(entry->hdr->hmat);
a103f46633fdcd Dave Jiang 2023-10-12   76  	case ACPI_SUBTABLE_PRMT:
a103f46633fdcd Dave Jiang 2023-10-12   77  		return sizeof(entry->hdr->prmt);
a103f46633fdcd Dave Jiang 2023-10-12   78  	case ACPI_SUBTABLE_CEDT:
a103f46633fdcd Dave Jiang 2023-10-12   79  		return sizeof(entry->hdr->cedt);
13b7d7a98b65d1 Dave Jiang 2023-05-24   80  	case CDAT_SUBTABLE:
13b7d7a98b65d1 Dave Jiang 2023-05-24   81  		return sizeof(entry->hdr->cdat);
a103f46633fdcd Dave Jiang 2023-10-12   82  	}
a103f46633fdcd Dave Jiang 2023-10-12   83  	return 0;
a103f46633fdcd Dave Jiang 2023-10-12   84  }
a103f46633fdcd Dave Jiang 2023-10-12   85  
a103f46633fdcd Dave Jiang 2023-10-12  @86  static enum acpi_subtable_type __init_or_acpilib
a103f46633fdcd Dave Jiang 2023-10-12   87  acpi_get_subtable_type(char *id)
a103f46633fdcd Dave Jiang 2023-10-12   88  {
a103f46633fdcd Dave Jiang 2023-10-12   89  	if (strncmp(id, ACPI_SIG_HMAT, 4) == 0)
a103f46633fdcd Dave Jiang 2023-10-12   90  		return ACPI_SUBTABLE_HMAT;
a103f46633fdcd Dave Jiang 2023-10-12   91  	if (strncmp(id, ACPI_SIG_PRMT, 4) == 0)
a103f46633fdcd Dave Jiang 2023-10-12   92  		return ACPI_SUBTABLE_PRMT;
a103f46633fdcd Dave Jiang 2023-10-12   93  	if (strncmp(id, ACPI_SIG_CEDT, 4) == 0)
a103f46633fdcd Dave Jiang 2023-10-12   94  		return ACPI_SUBTABLE_CEDT;
13b7d7a98b65d1 Dave Jiang 2023-05-24   95  	if (strncmp(id, ACPI_SIG_CDAT, 4) == 0)
13b7d7a98b65d1 Dave Jiang 2023-05-24   96  		return CDAT_SUBTABLE;
a103f46633fdcd Dave Jiang 2023-10-12   97  	return ACPI_SUBTABLE_COMMON;
a103f46633fdcd Dave Jiang 2023-10-12   98  }
a103f46633fdcd Dave Jiang 2023-10-12   99  
13b7d7a98b65d1 Dave Jiang 2023-05-24  100  static unsigned long __init_or_acpilib
13b7d7a98b65d1 Dave Jiang 2023-05-24  101  acpi_table_get_length(enum acpi_subtable_type type,
13b7d7a98b65d1 Dave Jiang 2023-05-24  102  		      union fw_table_header *header)
13b7d7a98b65d1 Dave Jiang 2023-05-24  103  {
13b7d7a98b65d1 Dave Jiang 2023-05-24  104  	if (type == CDAT_SUBTABLE) {
13b7d7a98b65d1 Dave Jiang 2023-05-24  105  		__le32 length = (__force __le32)header->cdat.length;
13b7d7a98b65d1 Dave Jiang 2023-05-24  106  
13b7d7a98b65d1 Dave Jiang 2023-05-24  107  		return le32_to_cpu(length);
13b7d7a98b65d1 Dave Jiang 2023-05-24  108  	}
13b7d7a98b65d1 Dave Jiang 2023-05-24  109  
13b7d7a98b65d1 Dave Jiang 2023-05-24  110  	return header->acpi.length;
13b7d7a98b65d1 Dave Jiang 2023-05-24  111  }
13b7d7a98b65d1 Dave Jiang 2023-05-24  112  
a103f46633fdcd Dave Jiang 2023-10-12 @113  static __init_or_acpilib bool has_handler(struct acpi_subtable_proc *proc)
a103f46633fdcd Dave Jiang 2023-10-12  114  {
a103f46633fdcd Dave Jiang 2023-10-12  115  	return proc->handler || proc->handler_arg;
a103f46633fdcd Dave Jiang 2023-10-12  116  }
a103f46633fdcd Dave Jiang 2023-10-12  117  
a103f46633fdcd Dave Jiang 2023-10-12 @118  static __init_or_acpilib int call_handler(struct acpi_subtable_proc *proc,
a103f46633fdcd Dave Jiang 2023-10-12  119  					  union acpi_subtable_headers *hdr,
a103f46633fdcd Dave Jiang 2023-10-12  120  					  unsigned long end)
a103f46633fdcd Dave Jiang 2023-10-12  121  {
a103f46633fdcd Dave Jiang 2023-10-12 @122  	if (proc->handler)
a103f46633fdcd Dave Jiang 2023-10-12  123  		return proc->handler(hdr, end);
a103f46633fdcd Dave Jiang 2023-10-12  124  	if (proc->handler_arg)
a103f46633fdcd Dave Jiang 2023-10-12  125  		return proc->handler_arg(hdr, proc->arg, end);
a103f46633fdcd Dave Jiang 2023-10-12  126  	return -EINVAL;
a103f46633fdcd Dave Jiang 2023-10-12  127  }
a103f46633fdcd Dave Jiang 2023-10-12  128  
a103f46633fdcd Dave Jiang 2023-10-12  129  /**
a103f46633fdcd Dave Jiang 2023-10-12  130   * acpi_parse_entries_array - for each proc_num find a suitable subtable
a103f46633fdcd Dave Jiang 2023-10-12  131   *
a103f46633fdcd Dave Jiang 2023-10-12  132   * @id: table id (for debugging purposes)
a103f46633fdcd Dave Jiang 2023-10-12  133   * @table_size: size of the root table
a103f46633fdcd Dave Jiang 2023-10-12  134   * @table_header: where does the table start?
a103f46633fdcd Dave Jiang 2023-10-12  135   * @proc: array of acpi_subtable_proc struct containing entry id
a103f46633fdcd Dave Jiang 2023-10-12  136   *        and associated handler with it
a103f46633fdcd Dave Jiang 2023-10-12  137   * @proc_num: how big proc is?
a103f46633fdcd Dave Jiang 2023-10-12  138   * @max_entries: how many entries can we process?
a103f46633fdcd Dave Jiang 2023-10-12  139   *
a103f46633fdcd Dave Jiang 2023-10-12  140   * For each proc_num find a subtable with proc->id and run proc->handler
a103f46633fdcd Dave Jiang 2023-10-12  141   * on it. Assumption is that there's only single handler for particular
a103f46633fdcd Dave Jiang 2023-10-12  142   * entry id.
a103f46633fdcd Dave Jiang 2023-10-12  143   *
a103f46633fdcd Dave Jiang 2023-10-12  144   * The table_size is not the size of the complete ACPI table (the length
a103f46633fdcd Dave Jiang 2023-10-12  145   * field in the header struct), but only the size of the root table; i.e.,
a103f46633fdcd Dave Jiang 2023-10-12  146   * the offset from the very first byte of the complete ACPI table, to the
a103f46633fdcd Dave Jiang 2023-10-12  147   * first byte of the very first subtable.
a103f46633fdcd Dave Jiang 2023-10-12  148   *
a103f46633fdcd Dave Jiang 2023-10-12  149   * On success returns sum of all matching entries for all proc handlers.
a103f46633fdcd Dave Jiang 2023-10-12  150   * Otherwise, -ENODEV or -EINVAL is returned.
a103f46633fdcd Dave Jiang 2023-10-12  151   */
a103f46633fdcd Dave Jiang 2023-10-12 @152  int __init_or_acpilib
a103f46633fdcd Dave Jiang 2023-10-12  153  acpi_parse_entries_array(char *id, unsigned long table_size,
13b7d7a98b65d1 Dave Jiang 2023-05-24  154  			 union fw_table_header *table_header,
a103f46633fdcd Dave Jiang 2023-10-12  155  			 struct acpi_subtable_proc *proc,
a103f46633fdcd Dave Jiang 2023-10-12  156  			 int proc_num, unsigned int max_entries)
a103f46633fdcd Dave Jiang 2023-10-12  157  {
a103f46633fdcd Dave Jiang 2023-10-12  158  	unsigned long table_end, subtable_len, entry_len;
a103f46633fdcd Dave Jiang 2023-10-12  159  	struct acpi_subtable_entry entry;
13b7d7a98b65d1 Dave Jiang 2023-05-24  160  	enum acpi_subtable_type type;
a103f46633fdcd Dave Jiang 2023-10-12  161  	int count = 0;
a103f46633fdcd Dave Jiang 2023-10-12  162  	int errs = 0;
a103f46633fdcd Dave Jiang 2023-10-12  163  	int i;
a103f46633fdcd Dave Jiang 2023-10-12  164  
13b7d7a98b65d1 Dave Jiang 2023-05-24  165  	type = acpi_get_subtable_type(id);
13b7d7a98b65d1 Dave Jiang 2023-05-24  166  	table_end = (unsigned long)table_header +
13b7d7a98b65d1 Dave Jiang 2023-05-24  167  		    acpi_table_get_length(type, table_header);
a103f46633fdcd Dave Jiang 2023-10-12  168  
a103f46633fdcd Dave Jiang 2023-10-12  169  	/* Parse all entries looking for a match. */
a103f46633fdcd Dave Jiang 2023-10-12  170  
13b7d7a98b65d1 Dave Jiang 2023-05-24  171  	entry.type = type;
a103f46633fdcd Dave Jiang 2023-10-12  172  	entry.hdr = (union acpi_subtable_headers *)
a103f46633fdcd Dave Jiang 2023-10-12  173  	    ((unsigned long)table_header + table_size);
a103f46633fdcd Dave Jiang 2023-10-12  174  	subtable_len = acpi_get_subtable_header_length(&entry);
a103f46633fdcd Dave Jiang 2023-10-12  175  
a103f46633fdcd Dave Jiang 2023-10-12  176  	while (((unsigned long)entry.hdr) + subtable_len  < table_end) {
a103f46633fdcd Dave Jiang 2023-10-12  177  		if (max_entries && count >= max_entries)
a103f46633fdcd Dave Jiang 2023-10-12  178  			break;
a103f46633fdcd Dave Jiang 2023-10-12  179  
a103f46633fdcd Dave Jiang 2023-10-12  180  		for (i = 0; i < proc_num; i++) {
a103f46633fdcd Dave Jiang 2023-10-12  181  			if (acpi_get_entry_type(&entry) != proc[i].id)
a103f46633fdcd Dave Jiang 2023-10-12  182  				continue;
a103f46633fdcd Dave Jiang 2023-10-12  183  			if (!has_handler(&proc[i]) ||
a103f46633fdcd Dave Jiang 2023-10-12  184  			    (!errs &&
a103f46633fdcd Dave Jiang 2023-10-12  185  			     call_handler(&proc[i], entry.hdr, table_end))) {
a103f46633fdcd Dave Jiang 2023-10-12  186  				errs++;
a103f46633fdcd Dave Jiang 2023-10-12  187  				continue;
a103f46633fdcd Dave Jiang 2023-10-12  188  			}
a103f46633fdcd Dave Jiang 2023-10-12  189  
a103f46633fdcd Dave Jiang 2023-10-12  190  			proc[i].count++;
a103f46633fdcd Dave Jiang 2023-10-12  191  			break;
a103f46633fdcd Dave Jiang 2023-10-12  192  		}
a103f46633fdcd Dave Jiang 2023-10-12  193  		if (i != proc_num)
a103f46633fdcd Dave Jiang 2023-10-12  194  			count++;
a103f46633fdcd Dave Jiang 2023-10-12  195  
a103f46633fdcd Dave Jiang 2023-10-12  196  		/*
a103f46633fdcd Dave Jiang 2023-10-12  197  		 * If entry->length is 0, break from this loop to avoid
a103f46633fdcd Dave Jiang 2023-10-12  198  		 * infinite loop.
a103f46633fdcd Dave Jiang 2023-10-12  199  		 */
a103f46633fdcd Dave Jiang 2023-10-12  200  		entry_len = acpi_get_entry_length(&entry);
a103f46633fdcd Dave Jiang 2023-10-12  201  		if (entry_len == 0) {
a103f46633fdcd Dave Jiang 2023-10-12  202  			pr_err("[%4.4s:0x%02x] Invalid zero length\n", id, proc->id);
a103f46633fdcd Dave Jiang 2023-10-12  203  			return -EINVAL;
a103f46633fdcd Dave Jiang 2023-10-12  204  		}
a103f46633fdcd Dave Jiang 2023-10-12  205  
a103f46633fdcd Dave Jiang 2023-10-12  206  		entry.hdr = (union acpi_subtable_headers *)
a103f46633fdcd Dave Jiang 2023-10-12  207  		    ((unsigned long)entry.hdr + entry_len);
a103f46633fdcd Dave Jiang 2023-10-12  208  	}
a103f46633fdcd Dave Jiang 2023-10-12  209  
a103f46633fdcd Dave Jiang 2023-10-12  210  	if (max_entries && count > max_entries) {
a103f46633fdcd Dave Jiang 2023-10-12  211  		pr_warn("[%4.4s:0x%02x] found the maximum %i entries\n",
a103f46633fdcd Dave Jiang 2023-10-12  212  			id, proc->id, count);
a103f46633fdcd Dave Jiang 2023-10-12  213  	}
a103f46633fdcd Dave Jiang 2023-10-12  214  
a103f46633fdcd Dave Jiang 2023-10-12  215  	return errs ? -EINVAL : count;
a103f46633fdcd Dave Jiang 2023-10-12  216  }
13b7d7a98b65d1 Dave Jiang 2023-05-24  217  
13b7d7a98b65d1 Dave Jiang 2023-05-24  218  int cdat_table_parse(enum acpi_cdat_type type,
13b7d7a98b65d1 Dave Jiang 2023-05-24 @219  		     acpi_tbl_entry_handler_arg handler_arg, void *arg,
13b7d7a98b65d1 Dave Jiang 2023-05-24  220  		     struct acpi_table_cdat *table_header)
13b7d7a98b65d1 Dave Jiang 2023-05-24  221  {
13b7d7a98b65d1 Dave Jiang 2023-05-24 @222  	struct acpi_subtable_proc proc = {

:::::: The code at line 29 was first introduced by commit
:::::: a103f46633fdcddc2aaca506420f177e8803a2bd acpi: Move common tables helper functions to common lib

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
