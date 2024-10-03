Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C519414601C;
	Thu,  3 Oct 2024 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727950347; cv=none; b=Hi6TUH030qPLAd7ID7uLrHXKWW4DkZ0o1BW/v99yujKBwrIb57I8MDf8+9+HuGoEjDFSFUAOF3TjQOWi2aLq71ZMpLWg8Hzzs1WZQxdSTaa5kaMtg8SRbj5K3emnHqhX3i+Tg7yAz1nJzAefU3xZw5jcwPOLrd30owxQVrXPj9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727950347; c=relaxed/simple;
	bh=XjNanImzl+Dgidm1UATA7oR70Qm9s5ThDKwAaILR4fI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TNjPHWb0JEJH7bgLGOFT1C/BqonXX6WCRaIfnFscV4YSqWvDnFg/8W7NT0F2fw9mDisFnLpORks1h9+Q0xmYRdAExlxsJzW4MUY3dFXkvz0I8Oubz3h+WiMfwHoWd+L2+1HdWyk1boleCqNpuX1XKRBTfRf5Vlbimd6EGFNYizI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBSvWphz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBSvWphz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727950346; x=1759486346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XjNanImzl+Dgidm1UATA7oR70Qm9s5ThDKwAaILR4fI=;
  b=WBSvWphzZS61Y5wbnng4HZa6IUngqPPWU3m0whpKhRsdd8BsSnMPsNab
   y2K61qTaNcJ/qlH3/1FqfMTzplMknbxAMdE/nWLRxSqbAwUHJME3kET1w
   1pOUqjCq2TN8rLk9Voy+kwjhl4whub30RH899G29Ff9Xgn9FbyI9FBxJZ
   /xIGEuz/D2HbonJXPGfhmiJch6+EZpwWl6zpRiRvOByWaaneBvMzMOFfb
   OPNuYx+R67XyAmI5vsbhe9Uh5ZaNgLGf46di8O9O6NyHee+RLqRLqn1Ni
   CTKHqhBvcpbgDVf1b8U08hqETwHmKpxNCnHNvR/VGsrUJ8YCjABfa8v0w
   w==;
X-CSE-ConnectionGUID: HLZjMjjTR8etxLbYC/lFeQ==
X-CSE-MsgGUID: a72mErBeTCaVPAKLL2Y6Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27316385"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27316385"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:12:25 -0700
X-CSE-ConnectionGUID: CUmXx7l2SFqSVUCoWSUd9w==
X-CSE-MsgGUID: rT10cGbkTb62krnBznvi2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="111764102"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2024 03:12:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swIon-0000H3-1K;
	Thu, 03 Oct 2024 10:12:21 +0000
Date: Thu, 3 Oct 2024 18:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-fixes 11/11] fs/netfs/read_retry.c:235:20:
 warning: variable 'subreq' is uninitialized when used here
Message-ID: <202410031854.Pi5OSJhP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   138e9fb0a2ea3886803ba42efac5eb869d944f31
commit: 138e9fb0a2ea3886803ba42efac5eb869d944f31 [11/11] netfs: Change the read result collector to only use one work item
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241003/202410031854.Pi5OSJhP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031854.Pi5OSJhP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031854.Pi5OSJhP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/read_retry.c:235:20: warning: variable 'subreq' is uninitialized when used here [-Wuninitialized]
     235 |         if (list_is_last(&subreq->rreq_link, &stream->subrequests))
         |                           ^~~~~~
   fs/netfs/read_retry.c:28:36: note: initialize the variable 'subreq' to silence this warning
      28 |         struct netfs_io_subrequest *subreq;
         |                                           ^
         |                                            = NULL
   1 warning generated.


vim +/subreq +235 fs/netfs/read_retry.c

    21	
    22	/*
    23	 * Go through the list of failed/short reads, retrying all retryable ones.  We
    24	 * need to switch failed cache reads to network downloads.
    25	 */
    26	static void netfs_retry_read_subrequests(struct netfs_io_request *rreq)
    27	{
    28		struct netfs_io_subrequest *subreq;
    29		struct netfs_io_stream *stream = &rreq->io_streams[0];
    30		struct list_head *next;
    31	
    32		_enter("R=%x", rreq->debug_id);
    33	
    34		if (list_empty(&stream->subrequests))
    35			return;
    36	
    37		if (rreq->netfs_ops->retry_request)
    38			rreq->netfs_ops->retry_request(rreq, NULL);
    39	
    40		/* If there's no renegotiation to do, just resend each retryable subreq
    41		 * up to the first permanently failed one.
    42		 */
    43		if (!rreq->netfs_ops->prepare_read &&
    44		    !test_bit(NETFS_RREQ_COPY_TO_CACHE, &rreq->flags)) {
    45			struct netfs_io_subrequest *subreq;
    46	
    47			list_for_each_entry(subreq, &stream->subrequests, rreq_link) {
    48				if (test_bit(NETFS_SREQ_FAILED, &subreq->flags))
    49					break;
    50				if (__test_and_clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags)) {
    51					netfs_reset_iter(subreq);
    52					netfs_reissue_read(rreq, subreq);
    53				}
    54			}
    55			return;
    56		}
    57	
    58		/* Okay, we need to renegotiate all the download requests and flip any
    59		 * failed cache reads over to being download requests and negotiate
    60		 * those also.  All fully successful subreqs have been removed from the
    61		 * list and any spare data from those has been donated.
    62		 *
    63		 * What we do is decant the list and rebuild it one subreq at a time so
    64		 * that we don't end up with donations jumping over a gap we're busy
    65		 * populating with smaller subrequests.  In the event that the subreq
    66		 * we just launched finishes before we insert the next subreq, it'll
    67		 * fill in rreq->prev_donated instead.
    68		 *
    69		 * Note: Alternatively, we could split the tail subrequest right before
    70		 * we reissue it and fix up the donations under lock.
    71		 */
    72		next = stream->subrequests.next;
    73	
    74		do {
    75			struct netfs_io_subrequest *subreq = NULL, *from, *to, *tmp;
    76			struct iov_iter source;
    77			unsigned long long start, len;
    78			size_t part;
    79			bool boundary = false;
    80	
    81			/* Go through the subreqs and find the next span of contiguous
    82			 * buffer that we then rejig (cifs, for example, needs the
    83			 * rsize renegotiating) and reissue.
    84			 */
    85			from = list_entry(next, struct netfs_io_subrequest, rreq_link);
    86			to = from;
    87			start = from->start + from->transferred;
    88			len   = from->len   - from->transferred;
    89	
    90			_debug("from R=%08x[%x] s=%llx ctl=%zx/%zx",
    91			       rreq->debug_id, from->debug_index,
    92			       from->start, from->transferred, from->len);
    93	
    94			if (test_bit(NETFS_SREQ_FAILED, &from->flags) ||
    95			    !test_bit(NETFS_SREQ_NEED_RETRY, &from->flags))
    96				goto abandon;
    97	
    98			list_for_each_continue(next, &stream->subrequests) {
    99				subreq = list_entry(next, struct netfs_io_subrequest, rreq_link);
   100				if (subreq->start + subreq->transferred != start + len ||
   101				    test_bit(NETFS_SREQ_BOUNDARY, &subreq->flags) ||
   102				    !test_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags))
   103					break;
   104				to = subreq;
   105				len += to->len;
   106			}
   107	
   108			_debug(" - range: %llx-%llx %llx", start, start + len - 1, len);
   109	
   110			/* Determine the set of buffers we're going to use.  Each
   111			 * subreq gets a subset of a single overall contiguous buffer.
   112			 */
   113			netfs_reset_iter(from);
   114			source = from->io_iter;
   115			source.count = len;
   116	
   117			/* Work through the sublist. */
   118			subreq = from;
   119			list_for_each_entry_from(subreq, &stream->subrequests, rreq_link) {
   120				if (!len)
   121					break;
   122				subreq->source	= NETFS_DOWNLOAD_FROM_SERVER;
   123				subreq->start	= start - subreq->transferred;
   124				subreq->len	= len   + subreq->transferred;
   125				__clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
   126				__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
   127				trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
   128	
   129				/* Renegotiate max_len (rsize) */
   130				stream->sreq_max_len = subreq->len;
   131				if (rreq->netfs_ops->prepare_read(subreq) < 0) {
   132					trace_netfs_sreq(subreq, netfs_sreq_trace_reprep_failed);
   133					__set_bit(NETFS_SREQ_FAILED, &subreq->flags);
   134					goto abandon;
   135				}
   136	
   137				part = umin(len, stream->sreq_max_len);
   138				if (unlikely(stream->sreq_max_segs))
   139					part = netfs_limit_iter(&source, 0, part, stream->sreq_max_segs);
   140				subreq->len = subreq->transferred + part;
   141				subreq->io_iter = source;
   142				iov_iter_truncate(&subreq->io_iter, part);
   143				iov_iter_advance(&source, part);
   144				len -= part;
   145				start += part;
   146				if (!len) {
   147					if (boundary)
   148						__set_bit(NETFS_SREQ_BOUNDARY, &subreq->flags);
   149				} else {
   150					__clear_bit(NETFS_SREQ_BOUNDARY, &subreq->flags);
   151				}
   152	
   153				netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
   154				netfs_reissue_read(rreq, subreq);
   155				if (subreq == to)
   156					break;
   157			}
   158	
   159			/* If we managed to use fewer subreqs, we can discard the
   160			 * excess; if we used the same number, then we're done.
   161			 */
   162			if (!len) {
   163				if (subreq == to)
   164					continue;
   165				list_for_each_entry_safe_from(subreq, tmp,
   166							      &stream->subrequests, rreq_link) {
   167					trace_netfs_sreq(subreq, netfs_sreq_trace_discard);
   168					list_del(&subreq->rreq_link);
   169					netfs_put_subrequest(subreq, false, netfs_sreq_trace_put_done);
   170					if (subreq == to)
   171						break;
   172				}
   173				continue;
   174			}
   175	
   176			/* We ran out of subrequests, so we need to allocate some more
   177			 * and insert them after.
   178			 */
   179			do {
   180				subreq = netfs_alloc_subrequest(rreq);
   181				if (!subreq) {
   182					subreq = to;
   183					goto abandon_after;
   184				}
   185				subreq->source		= NETFS_DOWNLOAD_FROM_SERVER;
   186				subreq->start		= start;
   187				subreq->len		= len;
   188				subreq->debug_index	= atomic_inc_return(&rreq->subreq_counter);
   189				subreq->stream_nr	= stream->stream_nr;
   190				__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
   191	
   192				trace_netfs_sreq_ref(rreq->debug_id, subreq->debug_index,
   193						     refcount_read(&subreq->ref),
   194						     netfs_sreq_trace_new);
   195				netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
   196	
   197				list_add(&subreq->rreq_link, &to->rreq_link);
   198				to = list_next_entry(to, rreq_link);
   199				trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
   200	
   201				stream->sreq_max_len	= umin(len, rreq->rsize);
   202				stream->sreq_max_segs	= 0;
   203				if (unlikely(stream->sreq_max_segs))
   204					part = netfs_limit_iter(&source, 0, part, stream->sreq_max_segs);
   205	
   206				netfs_stat(&netfs_n_rh_download);
   207				if (rreq->netfs_ops->prepare_read(subreq) < 0) {
   208					trace_netfs_sreq(subreq, netfs_sreq_trace_reprep_failed);
   209					__set_bit(NETFS_SREQ_FAILED, &subreq->flags);
   210					goto abandon;
   211				}
   212	
   213				part = umin(len, stream->sreq_max_len);
   214				subreq->len = subreq->transferred + part;
   215				subreq->io_iter = source;
   216				iov_iter_truncate(&subreq->io_iter, part);
   217				iov_iter_advance(&source, part);
   218	
   219				len -= part;
   220				start += part;
   221				if (!len && boundary) {
   222					__set_bit(NETFS_SREQ_BOUNDARY, &to->flags);
   223					boundary = false;
   224				}
   225	
   226				netfs_reissue_read(rreq, subreq);
   227			} while (len);
   228	
   229		} while (!list_is_head(next, &stream->subrequests));
   230	
   231		return;
   232	
   233		/* If we hit an error, fail all remaining incomplete subrequests */
   234	abandon_after:
 > 235		if (list_is_last(&subreq->rreq_link, &stream->subrequests))
   236			return;
   237		subreq = list_next_entry(subreq, rreq_link);
   238	abandon:
   239		list_for_each_entry_from(subreq, &stream->subrequests, rreq_link) {
   240			if (!subreq->error &&
   241			    !test_bit(NETFS_SREQ_FAILED, &subreq->flags) &&
   242			    !test_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags))
   243				continue;
   244			subreq->error = -ENOMEM;
   245			__set_bit(NETFS_SREQ_FAILED, &subreq->flags);
   246			__clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
   247			__clear_bit(NETFS_SREQ_RETRYING, &subreq->flags);
   248		}
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
