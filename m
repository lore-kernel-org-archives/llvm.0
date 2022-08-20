Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C037B
	for <llvm@lists.linux.dev>; Sat, 20 Aug 2022 04:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660969706; x=1692505706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wue6cwDbjoj7FHwki43YKg1NBcncyu/XW7pwLurmImE=;
  b=DoAzf+RPlfM3sJHgvxlajR9KxAeTN/ywJ8sV+xV88pUp9q5LTcN53gRz
   w9y5KNJaHyXeQUDteaIf6UdlnFyQSsviCLLRyMpJZ4w2xji2Ky/28a/Os
   FRgyVWO9P56WerC/MRkF8hXYz4qHKWDMb9+miiVcHgIGvwNnx/UU/77Me
   sueZirDrUQzx/S2wU/8+rZ7c6CCaUSLWDJnJoj2p325OLvS4gxzpqztwp
   3RRqXGQoVGySuM15Dwx9uHw9FecuFWngUaIbiX40LmAaEeGBdFeGQvjss
   BHw6isB91O6+LdjA/bi7uwzLlzhXcrHw2JTB/org061evZgD33gYLdv0v
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="294426223"
X-IronPort-AV: E=Sophos;i="5.93,250,1654585200"; 
   d="scan'208";a="294426223"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 21:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,250,1654585200"; 
   d="scan'208";a="853963468"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Aug 2022 21:28:24 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oPG5w-00028z-0Q;
	Sat, 20 Aug 2022 04:28:24 +0000
Date: Sat, 20 Aug 2022 12:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 2/4] tracing/eprobes: Do not hardcode $comm as a string
Message-ID: <202208201225.4wDs2D5d-lkp@intel.com>
References: <20220820014833.035925907@goodmis.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220820014833.035925907@goodmis.org>

Hi Steven,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on akpm-mm/mm-everything linus/master v6.0-rc1 next-20220819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-eprobes-Fixes-for-unexpected-arguments/20220820-095006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
config: arm64-buildonly-randconfig-r002-20220820 (https://download.01.org/0day-ci/archive/20220820/202208201225.4wDs2D5d-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c9a41fe60ab62f7a40049c100adcc8087a47669b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8afe7ca161a3e4f90f4851927005e15f8bd5c094
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Steven-Rostedt/tracing-eprobes-Fixes-for-unexpected-arguments/20220820-095006
        git checkout 8afe7ca161a3e4f90f4851927005e15f8bd5c094
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_probe.c:627:33: warning: '&&' within '||' [-Wlogical-op-parentheses]
           if (!(flags & TPARG_FL_TPOINT) &&
               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   kernel/trace/trace_probe.c:627:33: note: place parentheses around the '&&' expression to silence this warning
           if (!(flags & TPARG_FL_TPOINT) &&
                                          ^
               (
   1 warning generated.


vim +627 kernel/trace/trace_probe.c

   562	
   563	/* String length checking wrapper */
   564	static int traceprobe_parse_probe_arg_body(const char *argv, ssize_t *size,
   565			struct probe_arg *parg, unsigned int flags, int offset)
   566	{
   567		struct fetch_insn *code, *scode, *tmp = NULL;
   568		char *t, *t2, *t3;
   569		char *arg;
   570		int ret, len;
   571	
   572		arg = kstrdup(argv, GFP_KERNEL);
   573		if (!arg)
   574			return -ENOMEM;
   575	
   576		ret = -EINVAL;
   577		len = strlen(arg);
   578		if (len > MAX_ARGSTR_LEN) {
   579			trace_probe_log_err(offset, ARG_TOO_LONG);
   580			goto out;
   581		} else if (len == 0) {
   582			trace_probe_log_err(offset, NO_ARG_BODY);
   583			goto out;
   584		}
   585	
   586		ret = -ENOMEM;
   587		parg->comm = kstrdup(arg, GFP_KERNEL);
   588		if (!parg->comm)
   589			goto out;
   590	
   591		ret = -EINVAL;
   592		t = strchr(arg, ':');
   593		if (t) {
   594			*t = '\0';
   595			t2 = strchr(++t, '[');
   596			if (t2) {
   597				*t2++ = '\0';
   598				t3 = strchr(t2, ']');
   599				if (!t3) {
   600					offset += t2 + strlen(t2) - arg;
   601					trace_probe_log_err(offset,
   602							    ARRAY_NO_CLOSE);
   603					goto out;
   604				} else if (t3[1] != '\0') {
   605					trace_probe_log_err(offset + t3 + 1 - arg,
   606							    BAD_ARRAY_SUFFIX);
   607					goto out;
   608				}
   609				*t3 = '\0';
   610				if (kstrtouint(t2, 0, &parg->count) || !parg->count) {
   611					trace_probe_log_err(offset + t2 - arg,
   612							    BAD_ARRAY_NUM);
   613					goto out;
   614				}
   615				if (parg->count > MAX_ARRAY_LEN) {
   616					trace_probe_log_err(offset + t2 - arg,
   617							    ARRAY_TOO_BIG);
   618					goto out;
   619				}
   620			}
   621		}
   622	
   623		/*
   624		 * Since $comm and immediate string can not be dereferenced,
   625		 * we can find those by strcmp. But ignore for eprobes.
   626		 */
 > 627		if (!(flags & TPARG_FL_TPOINT) &&
   628		    strcmp(arg, "$comm") == 0 || strncmp(arg, "\\\"", 2) == 0) {
   629			/* The type of $comm must be "string", and not an array. */
   630			if (parg->count || (t && strcmp(t, "string")))
   631				goto out;
   632			parg->type = find_fetch_type("string");
   633		} else
   634			parg->type = find_fetch_type(t);
   635		if (!parg->type) {
   636			trace_probe_log_err(offset + (t ? (t - arg) : 0), BAD_TYPE);
   637			goto out;
   638		}
   639		parg->offset = *size;
   640		*size += parg->type->size * (parg->count ?: 1);
   641	
   642		ret = -ENOMEM;
   643		if (parg->count) {
   644			len = strlen(parg->type->fmttype) + 6;
   645			parg->fmt = kmalloc(len, GFP_KERNEL);
   646			if (!parg->fmt)
   647				goto out;
   648			snprintf(parg->fmt, len, "%s[%d]", parg->type->fmttype,
   649				 parg->count);
   650		}
   651	
   652		code = tmp = kcalloc(FETCH_INSN_MAX, sizeof(*code), GFP_KERNEL);
   653		if (!code)
   654			goto out;
   655		code[FETCH_INSN_MAX - 1].op = FETCH_OP_END;
   656	
   657		ret = parse_probe_arg(arg, parg->type, &code, &code[FETCH_INSN_MAX - 1],
   658				      flags, offset);
   659		if (ret)
   660			goto fail;
   661	
   662		ret = -EINVAL;
   663		/* Store operation */
   664		if (!strcmp(parg->type->name, "string") ||
   665		    !strcmp(parg->type->name, "ustring")) {
   666			if (code->op != FETCH_OP_DEREF && code->op != FETCH_OP_UDEREF &&
   667			    code->op != FETCH_OP_IMM && code->op != FETCH_OP_COMM &&
   668			    code->op != FETCH_OP_DATA && code->op != FETCH_OP_TP_ARG) {
   669				trace_probe_log_err(offset + (t ? (t - arg) : 0),
   670						    BAD_STRING);
   671				goto fail;
   672			}
   673			if ((code->op == FETCH_OP_IMM || code->op == FETCH_OP_COMM ||
   674			     code->op == FETCH_OP_DATA) || code->op == FETCH_OP_TP_ARG ||
   675			     parg->count) {
   676				/*
   677				 * IMM, DATA and COMM is pointing actual address, those
   678				 * must be kept, and if parg->count != 0, this is an
   679				 * array of string pointers instead of string address
   680				 * itself.
   681				 */
   682				code++;
   683				if (code->op != FETCH_OP_NOP) {
   684					trace_probe_log_err(offset, TOO_MANY_OPS);
   685					goto fail;
   686				}
   687			}
   688			/* If op == DEREF, replace it with STRING */
   689			if (!strcmp(parg->type->name, "ustring") ||
   690			    code->op == FETCH_OP_UDEREF)
   691				code->op = FETCH_OP_ST_USTRING;
   692			else
   693				code->op = FETCH_OP_ST_STRING;
   694			code->size = parg->type->size;
   695			parg->dynamic = true;
   696		} else if (code->op == FETCH_OP_DEREF) {
   697			code->op = FETCH_OP_ST_MEM;
   698			code->size = parg->type->size;
   699		} else if (code->op == FETCH_OP_UDEREF) {
   700			code->op = FETCH_OP_ST_UMEM;
   701			code->size = parg->type->size;
   702		} else {
   703			code++;
   704			if (code->op != FETCH_OP_NOP) {
   705				trace_probe_log_err(offset, TOO_MANY_OPS);
   706				goto fail;
   707			}
   708			code->op = FETCH_OP_ST_RAW;
   709			code->size = parg->type->size;
   710		}
   711		scode = code;
   712		/* Modify operation */
   713		if (t != NULL) {
   714			ret = __parse_bitfield_probe_arg(t, parg->type, &code);
   715			if (ret) {
   716				trace_probe_log_err(offset + t - arg, BAD_BITFIELD);
   717				goto fail;
   718			}
   719		}
   720		ret = -EINVAL;
   721		/* Loop(Array) operation */
   722		if (parg->count) {
   723			if (scode->op != FETCH_OP_ST_MEM &&
   724			    scode->op != FETCH_OP_ST_STRING &&
   725			    scode->op != FETCH_OP_ST_USTRING) {
   726				trace_probe_log_err(offset + (t ? (t - arg) : 0),
   727						    BAD_STRING);
   728				goto fail;
   729			}
   730			code++;
   731			if (code->op != FETCH_OP_NOP) {
   732				trace_probe_log_err(offset, TOO_MANY_OPS);
   733				goto fail;
   734			}
   735			code->op = FETCH_OP_LP_ARRAY;
   736			code->param = parg->count;
   737		}
   738		code++;
   739		code->op = FETCH_OP_END;
   740	
   741		ret = 0;
   742		/* Shrink down the code buffer */
   743		parg->code = kcalloc(code - tmp + 1, sizeof(*code), GFP_KERNEL);
   744		if (!parg->code)
   745			ret = -ENOMEM;
   746		else
   747			memcpy(parg->code, tmp, sizeof(*code) * (code - tmp + 1));
   748	
   749	fail:
   750		if (ret) {
   751			for (code = tmp; code < tmp + FETCH_INSN_MAX; code++)
   752				if (code->op == FETCH_NOP_SYMBOL ||
   753				    code->op == FETCH_OP_DATA)
   754					kfree(code->data);
   755		}
   756		kfree(tmp);
   757	out:
   758		kfree(arg);
   759	
   760		return ret;
   761	}
   762	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
