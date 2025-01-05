Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EBA171BB;
	Sun,  5 Jan 2025 03:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736048822; cv=none; b=IiRsG9ZynhbsqYtkOhW/cSYZYdRSIWxiHgtnWjjR5cWAmNBibrXAiTVgOOBQBnZIX8BllflMsv1LOPCadp2isA6l6gY3qjLjGyO5OiTbPTJ/0cwkSYtQXGyJGDG0zQZV7hkXTf6C/3GkTdfmWss8bRfsDqSilAK5b2E/LainxSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736048822; c=relaxed/simple;
	bh=+TeqafMl/OM0XNFNBDiF5WzqQgtdIZlMjUCeGoc3yKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bo8z6cN3lAS6tHvDRJsxjAmBMPotp4qaNqX8aJCUwHdNjIQE/7gh96CGQvawXesh7XiyCguc+LyLY49hu65gKTxmvGmGHj2KwCgVnmEWeLcSWdeRh2UNrTopMm3uZd7S542kKbKVHs1aRv5ZzIiOnKM8+XSII883kXEHe1JYtMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAp1Lb2X; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAp1Lb2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736048821; x=1767584821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+TeqafMl/OM0XNFNBDiF5WzqQgtdIZlMjUCeGoc3yKY=;
  b=AAp1Lb2XweP5z8YujgS2AWrXx8TZr80D4wUZS6Sjzv+E4fvMNwY/2K9x
   0XVeuzUxsD2WGlshNihGHDubMOi3vYWxw1fYmrWN/v39RnWgcvq8J5T8D
   mn1i2Syvdx7iaNX94sxIp7EfbTLq1JSuRmpMHHKoNkQh8Hp43wjB/Ys1Z
   gkQnX7hDNadQFbuw7PhMwANu2RCky4kZBlaFfpos6zUc9ftZGPf2716+Q
   hxea37RFVwSGJR4FXh3KbHtv9kMFGaEWN38qxhAP/vyEAS2DKOevfw3U3
   j80q1TR0tdaniFUAVJ9PandvEZ8bzbo/UkQvky1SGGV0sA7Upg27/D7PN
   w==;
X-CSE-ConnectionGUID: mdj+waXCQ3uo0BJP1MrH0A==
X-CSE-MsgGUID: 1pupeL6VQlyZG17a7hIg9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="36251400"
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="36251400"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 19:47:00 -0800
X-CSE-ConnectionGUID: IXhOI71kShmz1X9SqvYL/A==
X-CSE-MsgGUID: SmwLknrpQiOVFgTmw+F3gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101971665"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jan 2025 19:46:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUHbK-000BQh-2M;
	Sun, 05 Jan 2025 03:46:54 +0000
Date: Sun, 5 Jan 2025 11:45:54 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
	hbabu@us.ibm.com, haren@linux.ibm.com
Subject: Re: [PATCH 3/6] powerpc/pseries: Add papr-indices char driver for
 ibm,get-indices HCALL
Message-ID: <202501051117.D90y1VNS-lkp@intel.com>
References: <20250104204652.388720-4-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104204652.388720-4-haren@linux.ibm.com>

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-common-functions-for-RTAS-sequence-HCALLs/20250105-045010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250104204652.388720-4-haren%40linux.ibm.com
patch subject: [PATCH 3/6] powerpc/pseries: Add papr-indices char driver for ibm,get-indices HCALL
config: powerpc64-randconfig-002-20250105 (https://download.01.org/0day-ci/archive/20250105/202501051117.D90y1VNS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501051117.D90y1VNS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501051117.D90y1VNS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-indices.c:45: warning: expecting prototype for struct rtas_ibm_get_indices_params. Prototype was for struct rtas_get_indices_params instead
>> arch/powerpc/platforms/pseries/papr-indices.c:210: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Work function to be passed to papr_rtas_blob_generate().
>> arch/powerpc/platforms/pseries/papr-indices.c:247: warning: Function parameter or struct member 'file' not described in 'papr_indices_handle_read'
>> arch/powerpc/platforms/pseries/papr-indices.c:247: warning: Function parameter or struct member 'buf' not described in 'papr_indices_handle_read'
>> arch/powerpc/platforms/pseries/papr-indices.c:247: warning: Function parameter or struct member 'size' not described in 'papr_indices_handle_read'
>> arch/powerpc/platforms/pseries/papr-indices.c:247: warning: Function parameter or struct member 'off' not described in 'papr_indices_handle_read'


vim +45 arch/powerpc/platforms/pseries/papr-indices.c

    29	
    30	/**
    31	 * struct rtas_ibm_get_indices_params - Parameters (in and out) for
    32	 *                                      ibm,get-indices.
    33	 * @is_sensor:	In: Caller-provided whether sensor or indicator.
    34	 * @indice_type:In: Caller-provided indice (sensor or indicator) token
    35	 * @work_area:	In: Caller-provided work area buffer for results.
    36	 * @next:	In: Sequence number. Out: Next sequence number.
    37	 * @status:	Out: RTAS call status.
    38	 */
    39	struct rtas_get_indices_params {
    40		u8 is_sensor;
    41		u32 indice_type;
    42		struct rtas_work_area *work_area;
    43		u32 next;
    44		s32 status;
  > 45	};
    46	
    47	/**
    48	 * rtas_ibm_get_indices() - Call ibm,get-indices to fill a work area buffer.
    49	 * @params: See &struct rtas_ibm_get_indices_params.
    50	 *
    51	 * Calls ibm,get-indices until it errors or successfully deposits data
    52	 * into the supplied work area. Handles RTAS retry statuses. Maps RTAS
    53	 * error statuses to reasonable errno values.
    54	 *
    55	 * The caller is expected to invoke rtas_ibm_get_indices() multiple times
    56	 * to retrieve all indices data for the provided indice type. Only one
    57	 * sequence should be in progress at any time; starting a new sequence
    58	 * will disrupt any sequence already in progress. Serialization of
    59	 * indices retrieval sequences is the responsibility of the caller.
    60	 *
    61	 * The caller should inspect @params.status to determine whether more
    62	 * calls are needed to complete the sequence.
    63	 *
    64	 * Context: May sleep.
    65	 * Return: -ve on error, 0 otherwise.
    66	 */
    67	static int rtas_ibm_get_indices(struct rtas_get_indices_params *params)
    68	{
    69		struct rtas_work_area *work_area = params->work_area;
    70		const s32 token = rtas_function_token(RTAS_FN_IBM_GET_INDICES);
    71		u32 rets;
    72		s32 fwrc;
    73		int ret;
    74	
    75		if (token == RTAS_UNKNOWN_SERVICE)
    76			return -ENOENT;
    77	
    78		lockdep_assert_held(&rtas_ibm_get_indices_lock);
    79	
    80		do {
    81			fwrc = rtas_call(token, 5, 2, &rets, params->is_sensor,
    82					params->indice_type,
    83					rtas_work_area_phys(work_area),
    84					rtas_work_area_size(work_area),
    85					params->next);
    86		} while (rtas_busy_delay(fwrc));
    87	
    88		switch (fwrc) {
    89		case RTAS_HARDWARE_ERROR:
    90			ret = -EIO;
    91			break;
    92		case RTAS_INVALID_PARAMETER: /* Indicator type is not supported */
    93			ret = -EINVAL;
    94			break;
    95		case RTAS_IBM_GET_INDICES_START_OVER:
    96			ret = -EAGAIN;
    97			pr_info_ratelimited("Indices changed during retrieval, retrying\n");
    98			params->next = 1;
    99			break;
   100		case RTAS_IBM_GET_INDICES_MORE_DATA:
   101			params->next = rets;
   102			fallthrough;
   103		case RTAS_IBM_GET_INDICES_COMPLETE:
   104			params->next = 0;
   105			ret = 0;
   106			break;
   107		default:
   108			ret = -EIO;
   109			pr_err_ratelimited("unexpected ibm,get-indices status %d\n", fwrc);
   110			break;
   111		}
   112	
   113		params->status = fwrc;
   114		return ret;
   115	}
   116	
   117	/*
   118	 * Internal indices sequence APIs. A sequence is a series of calls to
   119	 * ibm,get-indices for a given location code. The sequence ends when
   120	 * an error is encountered or all indices for the input has been
   121	 * returned.
   122	 */
   123	
   124	/**
   125	 * indices_sequence_begin() - Begin a indices retrieval sequence.
   126	 * @seq:      Uninitialized sequence state.
   127	 * @params: Indices call parameters and initialization
   128	 *
   129	 * Initializes @seq with the resources necessary to carry out indices
   130	 * call sequence. Callers must pass @seq to indices_sequence_end()
   131	 * regardless of whether the sequence succeeds.
   132	 *
   133	 * Context: May sleep.
   134	 */
   135	static void indices_sequence_begin(struct papr_rtas_sequence *seq,
   136					void *params)
   137	{
   138		struct rtas_get_indices_params  *param;
   139	
   140		param = (struct rtas_get_indices_params *)params;
   141		/*
   142		 * We could allocate the work area before acquiring the
   143		 * function lock, but that would allow concurrent requests to
   144		 * exhaust the limited work area pool for no benefit. So
   145		 * allocate the work area under the lock.
   146		 */
   147		mutex_lock(&rtas_ibm_get_indices_lock);
   148		param->work_area = rtas_work_area_alloc(RTAS_GET_INDICES_BUF_SIZE);
   149		param->next = 1;
   150		param->status = 0;
   151		seq->params = param;
   152	}
   153	
   154	/**
   155	 * indices_sequence_end() - Finalize a indices retrieval sequence.
   156	 * @seq: indices call parameters from sequence struct
   157	 *
   158	 * Releases resources obtained by indices_sequence_begin().
   159	 */
   160	static void indices_sequence_end(struct papr_rtas_sequence *seq)
   161	{
   162		struct rtas_get_indices_params *param;
   163	
   164		param =  (struct rtas_get_indices_params *)seq->params;
   165		rtas_work_area_free(param->work_area);
   166		mutex_unlock(&rtas_ibm_get_indices_lock);
   167	}
   168	
   169	/**
   170	 * indices_sequence_should_stop() - Determine whether a indices
   171	 *                                  retrieval sequence should continue.
   172	 * @seq: indices sequence state.
   173	 *
   174	 * Examines the sequence error state and outputs of the last call to
   175	 * ibm,get-indices to determine whether the sequence in progress should
   176	 * continue or stop.
   177	 *
   178	 * Return: True if the sequence has encountered an error or if all
   179	 *         indices for this sequence has been retrieved. False otherwise.
   180	 */
   181	static bool indices_sequence_should_stop(const struct papr_rtas_sequence *seq)
   182	{
   183		struct rtas_get_indices_params *param;
   184		bool done;
   185	
   186		if (seq->error)
   187			return true;
   188	
   189		param =  (struct rtas_get_indices_params *)seq->params;
   190	
   191		switch (param->status) {
   192		case RTAS_IBM_GET_INDICES_COMPLETE:
   193			if (param->next == 1)
   194				done = false; /* Initial state. */
   195			else
   196				done = true; /* All data consumed. */
   197			break;
   198		case RTAS_IBM_GET_INDICES_MORE_DATA:
   199			done = false; /* More data available. */
   200			break;
   201		default:
   202			done = true; /* Error encountered. */
   203			break;
   204		}
   205	
   206		return done;
   207	}
   208	
   209	/**
 > 210	 * Work function to be passed to papr_rtas_blob_generate().
   211	 *
   212	 * ibm,get-indices RTAS call fills the work area with the certain
   213	 * format but does not return the bytes written in the buffer. So
   214	 * instead of kernel parsing this work area to determine the buffer
   215	 * length, copy the complete work area (RTAS_GET_INDICES_BUF_SIZE)
   216	 * to the blob and let the user space to obtain the data.
   217	 * Means RTAS_GET_INDICES_BUF_SIZE data will be returned for each
   218	 * read().
   219	 */
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
