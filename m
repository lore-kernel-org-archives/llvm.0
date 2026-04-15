Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6F53254AE;
	Wed, 15 Apr 2026 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776250281; cv=none; b=UHYxpqe8BswtGOH+TZHaOSILnsvQvV0MOi6Q7zFWFO7YEhEdtBszWYhSlbcKSaGi48Kl5XandogrnKpT8eY4VcsvDhdR65vn725pGJ+xzZ89whzSXxMBA+C7v6ILraZ4QfhUp/5832ycVFIMHVKIYEiMV/7f5Y6gSekLYqpJVa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776250281; c=relaxed/simple;
	bh=p2eb2QusH4nNnpTGhThjhQ333RaLfBaglWVz5h2lmvM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GsvH+l/lhjBSF0dY2RVKGfhpwtmwzpwPbHB6qDgReB8YynzgC3O9dA7AybrSsv0/KbAP7KNYFVwLfRmKMhOCVm5kxOoU5VuOVFuGlTqLAnxZepr4Piy8S49ObbzpsDJlpkipDru12oMDsAFUe1tvD1tiqzi/AJmeDUw6L+cwxkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cr01PAEz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cr01PAEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776250281; x=1807786281;
  h=date:from:to:cc:subject:message-id;
  bh=p2eb2QusH4nNnpTGhThjhQ333RaLfBaglWVz5h2lmvM=;
  b=Cr01PAEzUp3ESh3yZOM5eAwRWfptxcjNACyYhfFoyXmvZWCIzDj23gob
   eksInwUJm/dpIvpCsl2+E3ndhCrB6LcQaBb8jile96DLsiQsYQRh29jg3
   uYIMlsWGuuyOsFG1k7dB1+799dDsmkIDV6S6pE9P02m1uKLAsE9duElHF
   Hr8I+J8nQu2bHF8cEeiBHfw5Gq+p5IneqVSdE6sYqgnJUO7mM0TtOQ5Aj
   FDu86SlUl7JAATl/mbQ3G3/sBeciR4eIONlDh3JvhWuv/qjdrUgI8YRnq
   3cX4BNBi5HMm9ZAhUrZK+Kf5T48NAJ3M6ss/Np7ieIS5dD79dm50U3MTk
   Q==;
X-CSE-ConnectionGUID: rGbIAeBKSbSk12LOGocU4A==
X-CSE-MsgGUID: bUqpFRCOQFiokIFoaZ3Wyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76927726"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76927726"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 03:51:20 -0700
X-CSE-ConnectionGUID: /xybWPbaS3CKj+MFCIf7kg==
X-CSE-MsgGUID: KbSMTr4PR2uTiyPq2NqM1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="229533719"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2026 03:51:18 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCxpz-000000000j7-3mJG;
	Wed, 15 Apr 2026 10:51:15 +0000
Date: Wed, 15 Apr 2026 12:51:03 +0200
From: kernel test robot <lkp@intel.com>
To: Shyam Prasad N <sprasad@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:shyam-patch-5 1/1]
 fs/smb/client/smb2ops.c:2646:56: error: use of undeclared identifier
 'CIFS_DYNAMIC_BUFFER'
Message-ID: <202604151212.wuOu20Z5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git shyam-patch-5
head:   39308a2b5dfc90639437cc895c9bacecd2d8694b
commit: 39308a2b5dfc90639437cc895c9bacecd2d8694b [1/1] cifs: optimize readdir for small directories
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260415/202604151212.wuOu20Z5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604151212.wuOu20Z5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604151212.wuOu20Z5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/client/smb2ops.c:2646:56: error: use of undeclared identifier 'CIFS_DYNAMIC_BUFFER'
    2646 |                 rc = smb2_parse_query_directory(tcon, &combined_iov, CIFS_DYNAMIC_BUFFER,
         |                                                                      ^
   1 error generated.


vim +/CIFS_DYNAMIC_BUFFER +2646 fs/smb/client/smb2ops.c

  2434	
  2435	static int
  2436	smb2_query_dir_first(const unsigned int xid, struct cifs_tcon *tcon,
  2437			     const char *path, struct cifs_sb_info *cifs_sb,
  2438			     struct cifs_fid *fid, __u16 search_flags,
  2439			     struct cifs_search_info *srch_inf)
  2440	{
  2441		__le16 *utf16_path;
  2442		struct smb_rqst rqst[3];
  2443		struct kvec rsp_iov[3];
  2444		int resp_buftype[3];
  2445		struct kvec open_iov[SMB2_CREATE_IOV_SIZE];
  2446		struct kvec qd_iov[SMB2_QUERY_DIRECTORY_IOV_SIZE + 1]; /* +1 for padding */
  2447		struct kvec qd2_iov[SMB2_QUERY_DIRECTORY_IOV_SIZE + 1]; /* +1 for padding */
  2448		int rc, flags = 0;
  2449		u8 oplock = SMB2_OPLOCK_LEVEL_NONE;
  2450		struct cifs_open_parms oparms;
  2451		struct smb2_query_directory_rsp *qd_rsp = NULL;
  2452		struct smb2_query_directory_rsp *qd2_rsp = NULL;
  2453		struct smb2_create_rsp *op_rsp = NULL;
  2454		struct TCP_Server_Info *server;
  2455		int retries = 0, cur_sleep = 0;
  2456	
  2457	replay_again:
  2458		/* reinitialize for possible replay */
  2459		flags = 0;
  2460		oplock = SMB2_OPLOCK_LEVEL_NONE;
  2461		server = cifs_pick_channel(tcon->ses);
  2462	
  2463		utf16_path = cifs_convert_path_to_utf16(path, cifs_sb);
  2464		if (!utf16_path)
  2465			return -ENOMEM;
  2466	
  2467		if (smb3_encryption_required(tcon))
  2468			flags |= CIFS_TRANSFORM_REQ;
  2469	
  2470		memset(rqst, 0, sizeof(rqst));
  2471		resp_buftype[0] = resp_buftype[1] = resp_buftype[2] = CIFS_NO_BUFFER;
  2472		memset(rsp_iov, 0, sizeof(rsp_iov));
  2473	
  2474		/* Open */
  2475		memset(&open_iov, 0, sizeof(open_iov));
  2476		rqst[0].rq_iov = open_iov;
  2477		rqst[0].rq_nvec = SMB2_CREATE_IOV_SIZE;
  2478	
  2479		oparms = (struct cifs_open_parms) {
  2480			.tcon = tcon,
  2481			.path = path,
  2482			.desired_access = FILE_READ_ATTRIBUTES | FILE_READ_DATA,
  2483			.disposition = FILE_OPEN,
  2484			.create_options = cifs_create_options(cifs_sb, 0),
  2485			.fid = fid,
  2486			.replay = !!(retries),
  2487		};
  2488	
  2489		rc = SMB2_open_init(tcon, server,
  2490				    &rqst[0], &oplock, &oparms, utf16_path);
  2491		if (rc)
  2492			goto qdf_free;
  2493		smb2_set_next_command(tcon, &rqst[0]);
  2494	
  2495		/* First Query directory */
  2496		srch_inf->entries_in_buffer = 0;
  2497		srch_inf->index_of_last_entry = 2;
  2498	
  2499		memset(&qd_iov, 0, sizeof(qd_iov));
  2500		rqst[1].rq_iov = qd_iov;
  2501		rqst[1].rq_nvec = SMB2_QUERY_DIRECTORY_IOV_SIZE;
  2502	
  2503		rc = SMB2_query_directory_init(xid, tcon, server,
  2504					       &rqst[1],
  2505					       COMPOUND_FID, COMPOUND_FID,
  2506					       0, srch_inf->info_level,
  2507					       SMB2_QD1_OUTPUT_SIZE(CIFSMaxBufSize));
  2508		if (rc)
  2509			goto qdf_free;
  2510	
  2511		smb2_set_related(&rqst[1]);
  2512		smb2_set_next_command(tcon, &rqst[1]);
  2513	
  2514		/* Second Query directory - minimal size to check if more data exists */
  2515		memset(&qd2_iov, 0, sizeof(qd2_iov));
  2516		rqst[2].rq_iov = qd2_iov;
  2517		rqst[2].rq_nvec = SMB2_QUERY_DIRECTORY_IOV_SIZE;
  2518	
  2519		rc = SMB2_query_directory_init(xid, tcon, server,
  2520					       &rqst[2],
  2521					       COMPOUND_FID, COMPOUND_FID,
  2522					       0, srch_inf->info_level, SMB2_QD2_RESPONSE_SIZE);
  2523		if (rc)
  2524			goto qdf_free;
  2525	
  2526		smb2_set_related(&rqst[2]);
  2527	
  2528		if (retries) {
  2529			/* Back-off before retry */
  2530			if (cur_sleep)
  2531				msleep(cur_sleep);
  2532			smb2_set_replay(server, &rqst[0]);
  2533			smb2_set_replay(server, &rqst[1]);
  2534			smb2_set_replay(server, &rqst[2]);
  2535		}
  2536	
  2537		rc = compound_send_recv(xid, tcon->ses, server,
  2538					flags, 3, rqst,
  2539					resp_buftype, rsp_iov);
  2540	
  2541		/* If the open failed there is nothing to do */
  2542		op_rsp = (struct smb2_create_rsp *)rsp_iov[0].iov_base;
  2543		if (op_rsp == NULL || op_rsp->hdr.Status != STATUS_SUCCESS) {
  2544			cifs_dbg(FYI, "query_dir_first: open failed rc=%d\n", rc);
  2545			goto qdf_free;
  2546		}
  2547		fid->persistent_fid = op_rsp->PersistentFileId;
  2548		fid->volatile_fid = op_rsp->VolatileFileId;
  2549	
  2550		/* Anything else than ENODATA means a genuine error */
  2551		if (rc && rc != -ENODATA) {
  2552			SMB2_close(xid, tcon, fid->persistent_fid, fid->volatile_fid);
  2553			cifs_dbg(FYI, "query_dir_first: query directory failed rc=%d\n", rc);
  2554			trace_smb3_query_dir_err(xid, fid->persistent_fid,
  2555						 tcon->tid, tcon->ses->Suid, 0, 0, rc);
  2556			goto qdf_free;
  2557		}
  2558	
  2559		atomic_inc(&tcon->num_remote_opens);
  2560	
  2561		qd_rsp = (struct smb2_query_directory_rsp *)rsp_iov[1].iov_base;
  2562		if (qd_rsp->hdr.Status == STATUS_NO_MORE_FILES) {
  2563			trace_smb3_query_dir_done(xid, fid->persistent_fid,
  2564						  tcon->tid, tcon->ses->Suid, 0, 0);
  2565			srch_inf->endOfSearch = true;
  2566			rc = 0;
  2567			goto qdf_free;
  2568		}
  2569	
  2570		qd2_rsp = (struct smb2_query_directory_rsp *)rsp_iov[2].iov_base;
  2571	
  2572		/*
  2573		 * If QD2 has data, combine QD1 and QD2 responses before parsing.
  2574		 * The server cursor advances past both responses, so we can't discard QD2.
  2575		 */
  2576		if (qd2_rsp && qd2_rsp->hdr.Status == STATUS_SUCCESS &&
  2577		    le32_to_cpu(qd2_rsp->OutputBufferLength) > 0) {
  2578			char *combined_buf;
  2579			size_t qd1_data_len, qd2_data_len, combined_len;
  2580			u16 qd1_offset, qd2_offset;
  2581			struct smb2_query_directory_rsp *combined_rsp;
  2582			struct kvec combined_iov;
  2583			FILE_DIRECTORY_INFO *last_entry_in_qd1;
  2584			char *qd1_entries_start, *qd2_entries_start;
  2585			unsigned int next_offset;
  2586	
  2587			qd1_offset = le16_to_cpu(qd_rsp->OutputBufferOffset);
  2588			qd2_offset = le16_to_cpu(qd2_rsp->OutputBufferOffset);
  2589			qd1_data_len = le32_to_cpu(qd_rsp->OutputBufferLength);
  2590			qd2_data_len = le32_to_cpu(qd2_rsp->OutputBufferLength);
  2591	
  2592			/* Allocate buffer for: QD1 header + QD1 data + QD2 data */
  2593			combined_len = qd1_offset + qd1_data_len + qd2_data_len;
  2594			combined_buf = kmalloc(combined_len, GFP_KERNEL);
  2595			if (!combined_buf) {
  2596				rc = -ENOMEM;
  2597				goto qdf_free;
  2598			}
  2599	
  2600			/* Copy QD1 header and data */
  2601			memcpy(combined_buf, qd_rsp, qd1_offset + qd1_data_len);
  2602	
  2603			/* Append QD2 data (directory entries only, not the header) */
  2604			memcpy(combined_buf + qd1_offset + qd1_data_len,
  2605			       (char *)qd2_rsp + qd2_offset, qd2_data_len);
  2606	
  2607			/* Update OutputBufferLength to reflect combined data */
  2608			combined_rsp = (struct smb2_query_directory_rsp *)combined_buf;
  2609			combined_rsp->OutputBufferLength = cpu_to_le32(qd1_data_len + qd2_data_len);
  2610	
  2611			/*
  2612			 * Chain QD1 and QD2 entries: find the last entry in QD1 and update
  2613			 * its NextEntryOffset to point to the first entry in QD2.
  2614			 */
  2615			if (qd1_data_len > 0) {
  2616				qd1_entries_start = combined_buf + qd1_offset;
  2617				qd2_entries_start = combined_buf + qd1_offset + qd1_data_len;
  2618				last_entry_in_qd1 = (FILE_DIRECTORY_INFO *)qd1_entries_start;
  2619	
  2620				/* Walk QD1 entries to find the last one with bounds checking */
  2621				while (1) {
  2622					char *end_of_qd1 = qd1_entries_start + qd1_data_len;
  2623	
  2624					next_offset = le32_to_cpu(last_entry_in_qd1->NextEntryOffset);
  2625					if (next_offset == 0)
  2626						break;  /* Found last entry */
  2627	
  2628					/* Bounds check before advancing */
  2629					if ((char *)last_entry_in_qd1 + next_offset >= end_of_qd1) {
  2630						cifs_dbg(VFS, "query_dir_first: invalid NextEntryOffset in QD1\n");
  2631						kfree(combined_buf);
  2632						rc = -EIO;
  2633						goto qdf_free;
  2634					}
  2635	
  2636					last_entry_in_qd1 = (FILE_DIRECTORY_INFO *)((char *)last_entry_in_qd1 + next_offset);
  2637				}
  2638	
  2639				/* Chain last QD1 entry to first QD2 entry */
  2640				last_entry_in_qd1->NextEntryOffset = cpu_to_le32(qd2_entries_start - (char *)last_entry_in_qd1);
  2641			}
  2642	
  2643			/* Parse the combined buffer */
  2644			combined_iov.iov_base = combined_buf;
  2645			combined_iov.iov_len = combined_len;
> 2646			rc = smb2_parse_query_directory(tcon, &combined_iov, CIFS_DYNAMIC_BUFFER,
  2647							srch_inf);
  2648			if (rc) {
  2649				kfree(combined_buf);
  2650				trace_smb3_query_dir_err(xid, fid->persistent_fid, tcon->tid,
  2651							 tcon->ses->Suid, 0, 0, rc);
  2652				goto qdf_free;
  2653			}
  2654			/* Ownership of combined_buf transferred to srch_inf->ntwrk_buf_start */
  2655			srch_inf->endOfSearch = false;
  2656			cifs_dbg(FYI, "query_dir_first: combined QD1 and QD2, %d entries\n",
  2657				 srch_inf->entries_in_buffer);
  2658		} else {
  2659			/* No data in QD2, just parse QD1 */
  2660			rc = smb2_parse_query_directory(tcon, &rsp_iov[1], resp_buftype[1],
  2661							srch_inf);
  2662			if (rc) {
  2663				trace_smb3_query_dir_err(xid, fid->persistent_fid, tcon->tid,
  2664							 tcon->ses->Suid, 0, 0, rc);
  2665				goto qdf_free;
  2666			}
  2667			resp_buftype[1] = CIFS_NO_BUFFER;
  2668	
  2669			/* Check if QD2 indicates end of directory */
  2670			if (qd2_rsp && qd2_rsp->hdr.Status == STATUS_NO_MORE_FILES) {
  2671				srch_inf->endOfSearch = true;
  2672				cifs_dbg(FYI, "query_dir_first: small directory, all entries read\n");
  2673			}
  2674		}
  2675	
  2676		trace_smb3_query_dir_done(xid, fid->persistent_fid, tcon->tid,
  2677				tcon->ses->Suid, 0, srch_inf->entries_in_buffer);
  2678	
  2679	 qdf_free:
  2680		kfree(utf16_path);
  2681		SMB2_open_free(&rqst[0]);
  2682		SMB2_query_directory_free(&rqst[1]);
  2683		SMB2_query_directory_free(&rqst[2]);
  2684		free_rsp_buf(resp_buftype[0], rsp_iov[0].iov_base);
  2685		free_rsp_buf(resp_buftype[1], rsp_iov[1].iov_base);
  2686		free_rsp_buf(resp_buftype[2], rsp_iov[2].iov_base);
  2687	
  2688		if (is_replayable_error(rc) &&
  2689		    smb2_should_replay(tcon, &retries, &cur_sleep))
  2690			goto replay_again;
  2691	
  2692		return rc;
  2693	}
  2694	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
