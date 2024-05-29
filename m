Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20AF28F3;
	Wed, 29 May 2024 01:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716947636; cv=none; b=hVapblc0dh1ewBde5FLkjFpjIeOJKt1rEgtm1niR6Ner+G34Z4bpfEzdADGirRwg5LRApv9dYhuec1n1mxkLugNq/4TPxRm0d77reiFaD/9oQh3z7gi/1IgBIvjKTt5VP8JS+/ZIhYDi9yMnMVdWA9Gpkz+BCNryrJao8ygSVOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716947636; c=relaxed/simple;
	bh=m6Ft4sbliXDPqzG5rBrLiC88sUzqhukkyx9Euktp69g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReLgYfJ+9oLu+NPZMItbMoPzcimaEhTJuRfaINzZX3z/JdFxZRplVTFB74lsaPt9RCdB54Fj94BlnIrAWYsvDXj3JYfhC++74dmm9meLmYlDihyim8d6STme14eFx79zqSBh49hPKl7aExhgLHl9ronp7egV3uM/2KHr2fE3RW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMY9VL4e; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMY9VL4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716947634; x=1748483634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m6Ft4sbliXDPqzG5rBrLiC88sUzqhukkyx9Euktp69g=;
  b=mMY9VL4exQBOvBQw7cn7FAzRXsHTNwu9dkIIuSlrxA13kyVsL0EBep/n
   QBSMiNe6MJ4gqhaCA13cmVSt2Aq3wANWgNukTVaFkPKF3A7hDzjzbYd64
   xfq1ZiWgWreROjhRi07yQr5sJjBLH16+z5o/JeQAF8jLMQR4DA/Lx0Ys5
   NzS/9RvCsYAACPJgGwXVqYbBBE+sCuefkHE18icrXpG3KF1LRnpE5xgPE
   xeUQYy7dzEtN0EPdGjt8uPG2+Ivv6vVKvINjrPyRhc6JcSaa8kwLyL3xa
   HkF8GT0Jh1Uz2A+iMPPkVjpyRdE5Md20jIGFQtCsdhOXf/v9OZBkqnYIe
   A==;
X-CSE-ConnectionGUID: eEaU4xmoT7CfhCQffnpDnA==
X-CSE-MsgGUID: 8RRQ8WLWTu6ZBQ5VA3IKZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11741313"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="11741313"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 18:53:54 -0700
X-CSE-ConnectionGUID: pEJurzDfSw+BwlJYHESHnA==
X-CSE-MsgGUID: 46QvBlYjQreGugfN0gBelg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35243610"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 May 2024 18:53:52 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC8Vg-000Cza-0J;
	Wed, 29 May 2024 01:53:48 +0000
Date: Wed, 29 May 2024 09:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: lei lu <llfamsec@gmail.com>, almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	lei lu <llfamsec@gmail.com>
Subject: Re: [PATCH] ntfs3: Add a check for attr_names and oatbl
Message-ID: <202405290925.n21Mxwuz-lkp@intel.com>
References: <20240528200900.17980-1-llfamsec@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528200900.17980-1-llfamsec@gmail.com>

Hi lei,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10-rc1 next-20240528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lei-lu/ntfs3-Add-a-check-for-attr_names-and-oatbl/20240529-041305
base:   linus/master
patch link:    https://lore.kernel.org/r/20240528200900.17980-1-llfamsec%40gmail.com
patch subject: [PATCH] ntfs3: Add a check for attr_names and oatbl
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240529/202405290925.n21Mxwuz-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290925.n21Mxwuz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290925.n21Mxwuz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/ntfs3/fslog.c:4323:50: error: use of undeclared identifier 'attr_name_len'; did you mean 'attr_names_len'?
                           (struct ATTR_NAME_ENTRY *)Add2Ptr(attr_names, attr_name_len);
                                                                         ^~~~~~~~~~~~~
                                                                         attr_names_len
   fs/ntfs3/debug.h:18:47: note: expanded from macro 'Add2Ptr'
   #define Add2Ptr(P, I)           ((void *)((u8 *)(P) + (I)))
                                                          ^
   fs/ntfs3/fslog.c:3744:6: note: 'attr_names_len' declared here
           u32 attr_names_len, oatbl_len;
               ^
>> fs/ntfs3/fslog.c:4329:15: warning: comparison of distinct pointer types ('struct OPEN_ATTR_ENRTY *' and 'struct OPEN_ATTR_ENTRY *') [-Wcompare-distinct-pointer-types]
                           if (oe + 1 > oatbl_end) {
                               ~~~~~~ ^ ~~~~~~~~~
   1 warning and 1 error generated.


vim +4323 fs/ntfs3/fslog.c

  3709	
  3710	/*
  3711	 * log_replay - Replays log and empties it.
  3712	 *
  3713	 * This function is called during mount operation.
  3714	 * It replays log and empties it.
  3715	 * Initialized is set false if logfile contains '-1'.
  3716	 */
  3717	int log_replay(struct ntfs_inode *ni, bool *initialized)
  3718	{
  3719		int err;
  3720		struct ntfs_sb_info *sbi = ni->mi.sbi;
  3721		struct ntfs_log *log;
  3722	
  3723		u64 rec_lsn, checkpt_lsn = 0, rlsn = 0;
  3724		struct ATTR_NAME_ENTRY *attr_names = NULL;
  3725		struct RESTART_TABLE *dptbl = NULL;
  3726		struct RESTART_TABLE *trtbl = NULL;
  3727		const struct RESTART_TABLE *rt;
  3728		struct RESTART_TABLE *oatbl = NULL;
  3729		struct inode *inode;
  3730		struct OpenAttr *oa;
  3731		struct ntfs_inode *ni_oe;
  3732		struct ATTRIB *attr = NULL;
  3733		u64 size, vcn, undo_next_lsn;
  3734		CLST rno, lcn, lcn0, len0, clen;
  3735		void *data;
  3736		struct NTFS_RESTART *rst = NULL;
  3737		struct lcb *lcb = NULL;
  3738		struct OPEN_ATTR_ENRTY *oe;
  3739		struct TRANSACTION_ENTRY *tr;
  3740		struct DIR_PAGE_ENTRY *dp;
  3741		u32 i, bytes_per_attr_entry;
  3742		u32 vbo, tail, off, dlen;
  3743		u32 saved_len, rec_len, transact_id;
  3744		u32 attr_names_len, oatbl_len;
  3745		bool use_second_page;
  3746		struct RESTART_AREA *ra2, *ra = NULL;
  3747		struct CLIENT_REC *ca, *cr;
  3748		__le16 client;
  3749		struct RESTART_HDR *rh;
  3750		const struct LFS_RECORD_HDR *frh;
  3751		const struct LOG_REC_HDR *lrh;
  3752		bool is_mapped;
  3753		bool is_ro = sb_rdonly(sbi->sb);
  3754		u64 t64;
  3755		u16 t16;
  3756		u32 t32;
  3757	
  3758		log = kzalloc(sizeof(struct ntfs_log), GFP_NOFS);
  3759		if (!log)
  3760			return -ENOMEM;
  3761	
  3762		log->ni = ni;
  3763		log->l_size = log->orig_file_size = ni->vfs_inode.i_size;
  3764	
  3765		/* Get the size of page. NOTE: To replay we can use default page. */
  3766	#if PAGE_SIZE >= DefaultLogPageSize && PAGE_SIZE <= DefaultLogPageSize * 2
  3767		log->page_size = norm_file_page(PAGE_SIZE, &log->l_size, true);
  3768	#else
  3769		log->page_size = norm_file_page(PAGE_SIZE, &log->l_size, false);
  3770	#endif
  3771		if (!log->page_size) {
  3772			err = -EINVAL;
  3773			goto out;
  3774		}
  3775	
  3776		log->one_page_buf = kmalloc(log->page_size, GFP_NOFS);
  3777		if (!log->one_page_buf) {
  3778			err = -ENOMEM;
  3779			goto out;
  3780		}
  3781	
  3782		log->page_mask = log->page_size - 1;
  3783		log->page_bits = blksize_bits(log->page_size);
  3784	
  3785		/* Look for a restart area on the disk. */
  3786		err = log_read_rst(log, true, &log->rst_info);
  3787		if (err)
  3788			goto out;
  3789	
  3790		/* remember 'initialized' */
  3791		*initialized = log->rst_info.initialized;
  3792	
  3793		if (!log->rst_info.restart) {
  3794			if (log->rst_info.initialized) {
  3795				/* No restart area but the file is not initialized. */
  3796				err = -EINVAL;
  3797				goto out;
  3798			}
  3799	
  3800			log_init_pg_hdr(log, 1, 1);
  3801			log_create(log, 0, get_random_u32(), false, false);
  3802	
  3803			ra = log_create_ra(log);
  3804			if (!ra) {
  3805				err = -ENOMEM;
  3806				goto out;
  3807			}
  3808			log->ra = ra;
  3809			log->init_ra = true;
  3810	
  3811			goto process_log;
  3812		}
  3813	
  3814		/*
  3815		 * If the restart offset above wasn't zero then we won't
  3816		 * look for a second restart.
  3817		 */
  3818		if (log->rst_info.vbo)
  3819			goto check_restart_area;
  3820	
  3821		err = log_read_rst(log, false, &log->rst_info2);
  3822		if (err)
  3823			goto out;
  3824	
  3825		/* Determine which restart area to use. */
  3826		if (!log->rst_info2.restart ||
  3827		    log->rst_info2.last_lsn <= log->rst_info.last_lsn)
  3828			goto use_first_page;
  3829	
  3830		use_second_page = true;
  3831	
  3832		if (log->rst_info.chkdsk_was_run &&
  3833		    log->page_size != log->rst_info.vbo) {
  3834			struct RECORD_PAGE_HDR *sp = NULL;
  3835			bool usa_error;
  3836	
  3837			if (!read_log_page(log, log->page_size, &sp, &usa_error) &&
  3838			    sp->rhdr.sign == NTFS_CHKD_SIGNATURE) {
  3839				use_second_page = false;
  3840			}
  3841			kfree(sp);
  3842		}
  3843	
  3844		if (use_second_page) {
  3845			kfree(log->rst_info.r_page);
  3846			memcpy(&log->rst_info, &log->rst_info2,
  3847			       sizeof(struct restart_info));
  3848			log->rst_info2.r_page = NULL;
  3849		}
  3850	
  3851	use_first_page:
  3852		kfree(log->rst_info2.r_page);
  3853	
  3854	check_restart_area:
  3855		/*
  3856		 * If the restart area is at offset 0, we want
  3857		 * to write the second restart area first.
  3858		 */
  3859		log->init_ra = !!log->rst_info.vbo;
  3860	
  3861		/* If we have a valid page then grab a pointer to the restart area. */
  3862		ra2 = log->rst_info.valid_page ?
  3863			      Add2Ptr(log->rst_info.r_page,
  3864				      le16_to_cpu(log->rst_info.r_page->ra_off)) :
  3865			      NULL;
  3866	
  3867		if (log->rst_info.chkdsk_was_run ||
  3868		    (ra2 && ra2->client_idx[1] == LFS_NO_CLIENT_LE)) {
  3869			bool wrapped = false;
  3870			bool use_multi_page = false;
  3871			u32 open_log_count;
  3872	
  3873			/* Do some checks based on whether we have a valid log page. */
  3874			open_log_count = log->rst_info.valid_page ?
  3875						 le32_to_cpu(ra2->open_log_count) :
  3876						 get_random_u32();
  3877	
  3878			log_init_pg_hdr(log, 1, 1);
  3879	
  3880			log_create(log, log->rst_info.last_lsn, open_log_count, wrapped,
  3881				   use_multi_page);
  3882	
  3883			ra = log_create_ra(log);
  3884			if (!ra) {
  3885				err = -ENOMEM;
  3886				goto out;
  3887			}
  3888			log->ra = ra;
  3889	
  3890			/* Put the restart areas and initialize
  3891			 * the log file as required.
  3892			 */
  3893			goto process_log;
  3894		}
  3895	
  3896		if (!ra2) {
  3897			err = -EINVAL;
  3898			goto out;
  3899		}
  3900	
  3901		/*
  3902		 * If the log page or the system page sizes have changed, we can't
  3903		 * use the log file. We must use the system page size instead of the
  3904		 * default size if there is not a clean shutdown.
  3905		 */
  3906		t32 = le32_to_cpu(log->rst_info.r_page->sys_page_size);
  3907		if (log->page_size != t32) {
  3908			log->l_size = log->orig_file_size;
  3909			log->page_size = norm_file_page(t32, &log->l_size,
  3910							t32 == DefaultLogPageSize);
  3911		}
  3912	
  3913		if (log->page_size != t32 ||
  3914		    log->page_size != le32_to_cpu(log->rst_info.r_page->page_size)) {
  3915			err = -EINVAL;
  3916			goto out;
  3917		}
  3918	
  3919		/* If the file size has shrunk then we won't mount it. */
  3920		if (log->l_size < le64_to_cpu(ra2->l_size)) {
  3921			err = -EINVAL;
  3922			goto out;
  3923		}
  3924	
  3925		log_init_pg_hdr(log, le16_to_cpu(log->rst_info.r_page->major_ver),
  3926				le16_to_cpu(log->rst_info.r_page->minor_ver));
  3927	
  3928		log->l_size = le64_to_cpu(ra2->l_size);
  3929		log->seq_num_bits = le32_to_cpu(ra2->seq_num_bits);
  3930		log->file_data_bits = sizeof(u64) * 8 - log->seq_num_bits;
  3931		log->seq_num_mask = (8 << log->file_data_bits) - 1;
  3932		log->last_lsn = le64_to_cpu(ra2->current_lsn);
  3933		log->seq_num = log->last_lsn >> log->file_data_bits;
  3934		log->ra_off = le16_to_cpu(log->rst_info.r_page->ra_off);
  3935		log->restart_size = log->sys_page_size - log->ra_off;
  3936		log->record_header_len = le16_to_cpu(ra2->rec_hdr_len);
  3937		log->ra_size = le16_to_cpu(ra2->ra_len);
  3938		log->data_off = le16_to_cpu(ra2->data_off);
  3939		log->data_size = log->page_size - log->data_off;
  3940		log->reserved = log->data_size - log->record_header_len;
  3941	
  3942		vbo = lsn_to_vbo(log, log->last_lsn);
  3943	
  3944		if (vbo < log->first_page) {
  3945			/* This is a pseudo lsn. */
  3946			log->l_flags |= NTFSLOG_NO_LAST_LSN;
  3947			log->next_page = log->first_page;
  3948			goto find_oldest;
  3949		}
  3950	
  3951		/* Find the end of this log record. */
  3952		off = final_log_off(log, log->last_lsn,
  3953				    le32_to_cpu(ra2->last_lsn_data_len));
  3954	
  3955		/* If we wrapped the file then increment the sequence number. */
  3956		if (off <= vbo) {
  3957			log->seq_num += 1;
  3958			log->l_flags |= NTFSLOG_WRAPPED;
  3959		}
  3960	
  3961		/* Now compute the next log page to use. */
  3962		vbo &= ~log->sys_page_mask;
  3963		tail = log->page_size - (off & log->page_mask) - 1;
  3964	
  3965		/*
  3966		 *If we can fit another log record on the page,
  3967		 * move back a page the log file.
  3968		 */
  3969		if (tail >= log->record_header_len) {
  3970			log->l_flags |= NTFSLOG_REUSE_TAIL;
  3971			log->next_page = vbo;
  3972		} else {
  3973			log->next_page = next_page_off(log, vbo);
  3974		}
  3975	
  3976	find_oldest:
  3977		/*
  3978		 * Find the oldest client lsn. Use the last
  3979		 * flushed lsn as a starting point.
  3980		 */
  3981		log->oldest_lsn = log->last_lsn;
  3982		oldest_client_lsn(Add2Ptr(ra2, le16_to_cpu(ra2->client_off)),
  3983				  ra2->client_idx[1], &log->oldest_lsn);
  3984		log->oldest_lsn_off = lsn_to_vbo(log, log->oldest_lsn);
  3985	
  3986		if (log->oldest_lsn_off < log->first_page)
  3987			log->l_flags |= NTFSLOG_NO_OLDEST_LSN;
  3988	
  3989		if (!(ra2->flags & RESTART_SINGLE_PAGE_IO))
  3990			log->l_flags |= NTFSLOG_WRAPPED | NTFSLOG_MULTIPLE_PAGE_IO;
  3991	
  3992		log->current_openlog_count = le32_to_cpu(ra2->open_log_count);
  3993		log->total_avail_pages = log->l_size - log->first_page;
  3994		log->total_avail = log->total_avail_pages >> log->page_bits;
  3995		log->max_current_avail = log->total_avail * log->reserved;
  3996		log->total_avail = log->total_avail * log->data_size;
  3997	
  3998		log->current_avail = current_log_avail(log);
  3999	
  4000		ra = kzalloc(log->restart_size, GFP_NOFS);
  4001		if (!ra) {
  4002			err = -ENOMEM;
  4003			goto out;
  4004		}
  4005		log->ra = ra;
  4006	
  4007		t16 = le16_to_cpu(ra2->client_off);
  4008		if (t16 == offsetof(struct RESTART_AREA, clients)) {
  4009			memcpy(ra, ra2, log->ra_size);
  4010		} else {
  4011			memcpy(ra, ra2, offsetof(struct RESTART_AREA, clients));
  4012			memcpy(ra->clients, Add2Ptr(ra2, t16),
  4013			       le16_to_cpu(ra2->ra_len) - t16);
  4014	
  4015			log->current_openlog_count = get_random_u32();
  4016			ra->open_log_count = cpu_to_le32(log->current_openlog_count);
  4017			log->ra_size = offsetof(struct RESTART_AREA, clients) +
  4018				       sizeof(struct CLIENT_REC);
  4019			ra->client_off =
  4020				cpu_to_le16(offsetof(struct RESTART_AREA, clients));
  4021			ra->ra_len = cpu_to_le16(log->ra_size);
  4022		}
  4023	
  4024		le32_add_cpu(&ra->open_log_count, 1);
  4025	
  4026		/* Now we need to walk through looking for the last lsn. */
  4027		err = last_log_lsn(log);
  4028		if (err)
  4029			goto out;
  4030	
  4031		log->current_avail = current_log_avail(log);
  4032	
  4033		/* Remember which restart area to write first. */
  4034		log->init_ra = log->rst_info.vbo;
  4035	
  4036	process_log:
  4037		/* 1.0, 1.1, 2.0 log->major_ver/minor_ver - short values. */
  4038		switch ((log->major_ver << 16) + log->minor_ver) {
  4039		case 0x10000:
  4040		case 0x10001:
  4041		case 0x20000:
  4042			break;
  4043		default:
  4044			ntfs_warn(sbi->sb, "\x24LogFile version %d.%d is not supported",
  4045				  log->major_ver, log->minor_ver);
  4046			err = -EOPNOTSUPP;
  4047			log->set_dirty = true;
  4048			goto out;
  4049		}
  4050	
  4051		/* One client "NTFS" per logfile. */
  4052		ca = Add2Ptr(ra, le16_to_cpu(ra->client_off));
  4053	
  4054		for (client = ra->client_idx[1];; client = cr->next_client) {
  4055			if (client == LFS_NO_CLIENT_LE) {
  4056				/* Insert "NTFS" client LogFile. */
  4057				client = ra->client_idx[0];
  4058				if (client == LFS_NO_CLIENT_LE) {
  4059					err = -EINVAL;
  4060					goto out;
  4061				}
  4062	
  4063				t16 = le16_to_cpu(client);
  4064				cr = ca + t16;
  4065	
  4066				remove_client(ca, cr, &ra->client_idx[0]);
  4067	
  4068				cr->restart_lsn = 0;
  4069				cr->oldest_lsn = cpu_to_le64(log->oldest_lsn);
  4070				cr->name_bytes = cpu_to_le32(8);
  4071				cr->name[0] = cpu_to_le16('N');
  4072				cr->name[1] = cpu_to_le16('T');
  4073				cr->name[2] = cpu_to_le16('F');
  4074				cr->name[3] = cpu_to_le16('S');
  4075	
  4076				add_client(ca, t16, &ra->client_idx[1]);
  4077				break;
  4078			}
  4079	
  4080			cr = ca + le16_to_cpu(client);
  4081	
  4082			if (cpu_to_le32(8) == cr->name_bytes &&
  4083			    cpu_to_le16('N') == cr->name[0] &&
  4084			    cpu_to_le16('T') == cr->name[1] &&
  4085			    cpu_to_le16('F') == cr->name[2] &&
  4086			    cpu_to_le16('S') == cr->name[3])
  4087				break;
  4088		}
  4089	
  4090		/* Update the client handle with the client block information. */
  4091		log->client_id.seq_num = cr->seq_num;
  4092		log->client_id.client_idx = client;
  4093	
  4094		err = read_rst_area(log, &rst, &checkpt_lsn);
  4095		if (err)
  4096			goto out;
  4097	
  4098		if (!rst)
  4099			goto out;
  4100	
  4101		bytes_per_attr_entry = !rst->major_ver ? 0x2C : 0x28;
  4102	
  4103		if (rst->check_point_start)
  4104			checkpt_lsn = le64_to_cpu(rst->check_point_start);
  4105	
  4106		/* Allocate and Read the Transaction Table. */
  4107		if (!rst->transact_table_len)
  4108			goto check_dirty_page_table;
  4109	
  4110		t64 = le64_to_cpu(rst->transact_table_lsn);
  4111		err = read_log_rec_lcb(log, t64, lcb_ctx_prev, &lcb);
  4112		if (err)
  4113			goto out;
  4114	
  4115		lrh = lcb->log_rec;
  4116		frh = lcb->lrh;
  4117		rec_len = le32_to_cpu(frh->client_data_len);
  4118	
  4119		if (!check_log_rec(lrh, rec_len, le32_to_cpu(frh->transact_id),
  4120				   bytes_per_attr_entry)) {
  4121			err = -EINVAL;
  4122			goto out;
  4123		}
  4124	
  4125		t16 = le16_to_cpu(lrh->redo_off);
  4126	
  4127		rt = Add2Ptr(lrh, t16);
  4128		t32 = rec_len - t16;
  4129	
  4130		/* Now check that this is a valid restart table. */
  4131		if (!check_rstbl(rt, t32)) {
  4132			err = -EINVAL;
  4133			goto out;
  4134		}
  4135	
  4136		trtbl = kmemdup(rt, t32, GFP_NOFS);
  4137		if (!trtbl) {
  4138			err = -ENOMEM;
  4139			goto out;
  4140		}
  4141	
  4142		lcb_put(lcb);
  4143		lcb = NULL;
  4144	
  4145	check_dirty_page_table:
  4146		/* The next record back should be the Dirty Pages Table. */
  4147		if (!rst->dirty_pages_len)
  4148			goto check_attribute_names;
  4149	
  4150		t64 = le64_to_cpu(rst->dirty_pages_table_lsn);
  4151		err = read_log_rec_lcb(log, t64, lcb_ctx_prev, &lcb);
  4152		if (err)
  4153			goto out;
  4154	
  4155		lrh = lcb->log_rec;
  4156		frh = lcb->lrh;
  4157		rec_len = le32_to_cpu(frh->client_data_len);
  4158	
  4159		if (!check_log_rec(lrh, rec_len, le32_to_cpu(frh->transact_id),
  4160				   bytes_per_attr_entry)) {
  4161			err = -EINVAL;
  4162			goto out;
  4163		}
  4164	
  4165		t16 = le16_to_cpu(lrh->redo_off);
  4166	
  4167		rt = Add2Ptr(lrh, t16);
  4168		t32 = rec_len - t16;
  4169	
  4170		/* Now check that this is a valid restart table. */
  4171		if (!check_rstbl(rt, t32)) {
  4172			err = -EINVAL;
  4173			goto out;
  4174		}
  4175	
  4176		dptbl = kmemdup(rt, t32, GFP_NOFS);
  4177		if (!dptbl) {
  4178			err = -ENOMEM;
  4179			goto out;
  4180		}
  4181	
  4182		/* Convert Ra version '0' into version '1'. */
  4183		if (rst->major_ver)
  4184			goto end_conv_1;
  4185	
  4186		dp = NULL;
  4187		while ((dp = enum_rstbl(dptbl, dp))) {
  4188			struct DIR_PAGE_ENTRY_32 *dp0 = (struct DIR_PAGE_ENTRY_32 *)dp;
  4189			// NOTE: Danger. Check for of boundary.
  4190			memmove(&dp->vcn, &dp0->vcn_low,
  4191				2 * sizeof(u64) +
  4192					le32_to_cpu(dp->lcns_follow) * sizeof(u64));
  4193		}
  4194	
  4195	end_conv_1:
  4196		lcb_put(lcb);
  4197		lcb = NULL;
  4198	
  4199		/*
  4200		 * Go through the table and remove the duplicates,
  4201		 * remembering the oldest lsn values.
  4202		 */
  4203		if (sbi->cluster_size <= log->page_size)
  4204			goto trace_dp_table;
  4205	
  4206		dp = NULL;
  4207		while ((dp = enum_rstbl(dptbl, dp))) {
  4208			struct DIR_PAGE_ENTRY *next = dp;
  4209	
  4210			while ((next = enum_rstbl(dptbl, next))) {
  4211				if (next->target_attr == dp->target_attr &&
  4212				    next->vcn == dp->vcn) {
  4213					if (le64_to_cpu(next->oldest_lsn) <
  4214					    le64_to_cpu(dp->oldest_lsn)) {
  4215						dp->oldest_lsn = next->oldest_lsn;
  4216					}
  4217	
  4218					free_rsttbl_idx(dptbl, PtrOffset(dptbl, next));
  4219				}
  4220			}
  4221		}
  4222	trace_dp_table:
  4223	check_attribute_names:
  4224		/* The next record should be the Attribute Names. */
  4225		if (!rst->attr_names_len)
  4226			goto check_attr_table;
  4227	
  4228		t64 = le64_to_cpu(rst->attr_names_lsn);
  4229		err = read_log_rec_lcb(log, t64, lcb_ctx_prev, &lcb);
  4230		if (err)
  4231			goto out;
  4232	
  4233		lrh = lcb->log_rec;
  4234		frh = lcb->lrh;
  4235		rec_len = le32_to_cpu(frh->client_data_len);
  4236	
  4237		if (!check_log_rec(lrh, rec_len, le32_to_cpu(frh->transact_id),
  4238				   bytes_per_attr_entry)) {
  4239			err = -EINVAL;
  4240			goto out;
  4241		}
  4242	
  4243		t32 = lrh_length(lrh);
  4244		rec_len -= t32;
  4245	
  4246		attr_names = kmemdup(Add2Ptr(lrh, t32), rec_len, GFP_NOFS);
  4247		if (!attr_names) {
  4248			err = -ENOMEM;
  4249			goto out;
  4250		}
  4251		attr_names_len = rec_len;
  4252	
  4253		lcb_put(lcb);
  4254		lcb = NULL;
  4255	
  4256	check_attr_table:
  4257		/* The next record should be the attribute Table. */
  4258		if (!rst->open_attr_len)
  4259			goto check_attribute_names2;
  4260	
  4261		t64 = le64_to_cpu(rst->open_attr_table_lsn);
  4262		err = read_log_rec_lcb(log, t64, lcb_ctx_prev, &lcb);
  4263		if (err)
  4264			goto out;
  4265	
  4266		lrh = lcb->log_rec;
  4267		frh = lcb->lrh;
  4268		rec_len = le32_to_cpu(frh->client_data_len);
  4269	
  4270		if (!check_log_rec(lrh, rec_len, le32_to_cpu(frh->transact_id),
  4271				   bytes_per_attr_entry)) {
  4272			err = -EINVAL;
  4273			goto out;
  4274		}
  4275	
  4276		t16 = le16_to_cpu(lrh->redo_off);
  4277	
  4278		rt = Add2Ptr(lrh, t16);
  4279		t32 = rec_len - t16;
  4280	
  4281		if (!check_rstbl(rt, t32)) {
  4282			err = -EINVAL;
  4283			goto out;
  4284		}
  4285	
  4286		oatbl = kmemdup(rt, t32, GFP_NOFS);
  4287		if (!oatbl) {
  4288			err = -ENOMEM;
  4289			goto out;
  4290		}
  4291		oatbl_len = t32;
  4292	
  4293		log->open_attr_tbl = oatbl;
  4294	
  4295		/* Clear all of the Attr pointers. */
  4296		oe = NULL;
  4297		while ((oe = enum_rstbl(oatbl, oe))) {
  4298			if (!rst->major_ver) {
  4299				struct OPEN_ATTR_ENRTY_32 oe0;
  4300	
  4301				/* Really 'oe' points to OPEN_ATTR_ENRTY_32. */
  4302				memcpy(&oe0, oe, SIZEOF_OPENATTRIBUTEENTRY0);
  4303	
  4304				oe->bytes_per_index = oe0.bytes_per_index;
  4305				oe->type = oe0.type;
  4306				oe->is_dirty_pages = oe0.is_dirty_pages;
  4307				oe->name_len = 0;
  4308				oe->ref = oe0.ref;
  4309				oe->open_record_lsn = oe0.open_record_lsn;
  4310			}
  4311	
  4312			oe->is_attr_name = 0;
  4313			oe->ptr = NULL;
  4314		}
  4315	
  4316		lcb_put(lcb);
  4317		lcb = NULL;
  4318	
  4319	check_attribute_names2:
  4320		if (rst->attr_names_len && oatbl) {
  4321			struct ATTR_NAME_ENTRY *ane = attr_names;
  4322			struct ATTR_NAME_ENTRY *attr_names_end =
> 4323				(struct ATTR_NAME_ENTRY *)Add2Ptr(attr_names, attr_name_len);
  4324			struct OPEN_ATTR_ENTRY *oatbl_end =
  4325				(struct OPEN_ATTR_ENTRY *)Add2Ptr(oatbl, oatbl_len);
  4326			while (ane->off) {
  4327				/* TODO: Clear table on exit! */
  4328				oe = Add2Ptr(oatbl, le16_to_cpu(ane->off));
> 4329				if (oe + 1 > oatbl_end) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
