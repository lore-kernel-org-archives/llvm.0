Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6D71758F;
	Mon,  9 Sep 2024 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725900219; cv=none; b=nayO+3eEBQpJd7jBcaQRPtHnVpq1PYWFHtEb3tQ6EIF9Sotjl259/xl331AMJF1off+QgXCfv6F7NubBury1fqzyumxuP2Uh/VvX0oGwMKJ1gW5qZE1pIoowh8P+hDhus34mmX9Yiq036QtEYv9A3mT0707PvdOUGDZL8nZpjQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725900219; c=relaxed/simple;
	bh=CxkwlNhwsOwzy3bfMEFLI7wfFDEKBeG23/BRFi8qg8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GbcgpTmKoyvhRGhp7sM3V+lTrMw0uObY7TOAGnSjvMCx/+FRHtY3Od2p8qzBNWoOV9wrq+2HP6SYNmb/vIUGB/v+wutchyDZU4K9+8whQ7jvDT9KBst6MDuCBRLX8i5wZO4JYnMNCpZmWXXt3ZRi51EK0V7fVXv+2Ea02e4v6Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUjm32A0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUjm32A0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725900217; x=1757436217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CxkwlNhwsOwzy3bfMEFLI7wfFDEKBeG23/BRFi8qg8g=;
  b=VUjm32A0xTCdQKyT2gSyCGIJiPIIbZFUky/CGOpYMr7qh8u2axngHlQI
   T9k7zBNO4/5Kz+svecLwzDPZgmSVksdvthRIxtHJt+hkJfAc8TvLU1FhD
   okoXQDCkUeqvHygyg7he/6JoiLiTduiGVr87jE5NsGJkac1l4YzGk42qs
   PGtEzVIqOQIOwQ1GtpI/1DJAUx0j/MwwM+3sLpElE2ZPkMSISZw5SWbAY
   lideS2g+3VoM2jlV3N0kxlQ9Hqte/HzivgcK3S2Dw5dKTXIYzhpg8ZA1N
   +m0jPGokUvwh6EGwETM7ecg3gJmLloDBPllVWXf67d54PtJ8/4FAUxhoC
   g==;
X-CSE-ConnectionGUID: vOH1FMddQ9WbY/W2mooOoQ==
X-CSE-MsgGUID: 1K/Cny4wSVqBkoPSc7K+Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35989342"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="35989342"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 09:43:36 -0700
X-CSE-ConnectionGUID: KiOC7MxJR+K/Z9fSx4fUuQ==
X-CSE-MsgGUID: brdYe+zWRACNhLiyPniBxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="71139327"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Sep 2024 09:43:34 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snhUB-000EzE-35;
	Mon, 09 Sep 2024 16:43:31 +0000
Date: Tue, 10 Sep 2024 00:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 234/258]
 lib/zstd/compress/zstd_opt.c:698:49: error: call to undeclared library
 function 'memcmp' with type 'int (const void *, const void *, unsigned
 int)'; ISO C99 and later do not support implicit function declarations
Message-ID: <202409100015.FXotmJLU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 7bf0cb0943e978f0e501d865b587734b35ac5ee7 [234/258] XXX zstd debug
config: arm-mvebu_v7_defconfig (https://download.01.org/0day-ci/archive/20240910/202409100015.FXotmJLU-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100015.FXotmJLU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100015.FXotmJLU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/zstd/compress/zstd_opt.c:698:49: error: call to undeclared library function 'memcmp' with type 'int (const void *, const void *, unsigned int)'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
               if (matchIndex >= dictLimit) assert(memcmp(match, ip, matchLength) == 0);  /* ensure early section of match is equal as expected */
                                                   ^
   lib/zstd/compress/zstd_opt.c:698:49: note: include the header <string.h> or explicitly provide a declaration for 'memcmp'
   1 error generated.


vim +698 lib/zstd/compress/zstd_opt.c

e0c1b49f5b674c Nick Terrell 2020-09-11  554  
e0c1b49f5b674c Nick Terrell 2020-09-11  555  FORCE_INLINE_TEMPLATE
e0c1b49f5b674c Nick Terrell 2020-09-11  556  U32 ZSTD_insertBtAndGetAllMatches (
e0c1b49f5b674c Nick Terrell 2020-09-11  557                      ZSTD_match_t* matches,   /* store result (found matches) in this table (presumed large enough) */
e0c1b49f5b674c Nick Terrell 2020-09-11  558                      ZSTD_matchState_t* ms,
e0c1b49f5b674c Nick Terrell 2020-09-11  559                      U32* nextToUpdate3,
e0c1b49f5b674c Nick Terrell 2020-09-11  560                      const BYTE* const ip, const BYTE* const iLimit, const ZSTD_dictMode_e dictMode,
e0c1b49f5b674c Nick Terrell 2020-09-11  561                      const U32 rep[ZSTD_REP_NUM],
e0c1b49f5b674c Nick Terrell 2020-09-11  562                      U32 const ll0,   /* tells if associated literal length is 0 or not. This value must be 0 or 1 */
e0c1b49f5b674c Nick Terrell 2020-09-11  563                      const U32 lengthToBeat,
e0c1b49f5b674c Nick Terrell 2020-09-11  564                      U32 const mls /* template */)
e0c1b49f5b674c Nick Terrell 2020-09-11  565  {
e0c1b49f5b674c Nick Terrell 2020-09-11  566      const ZSTD_compressionParameters* const cParams = &ms->cParams;
e0c1b49f5b674c Nick Terrell 2020-09-11  567      U32 const sufficient_len = MIN(cParams->targetLength, ZSTD_OPT_NUM -1);
e0c1b49f5b674c Nick Terrell 2020-09-11  568      const BYTE* const base = ms->window.base;
e0c1b49f5b674c Nick Terrell 2020-09-11  569      U32 const curr = (U32)(ip-base);
e0c1b49f5b674c Nick Terrell 2020-09-11  570      U32 const hashLog = cParams->hashLog;
e0c1b49f5b674c Nick Terrell 2020-09-11  571      U32 const minMatch = (mls==3) ? 3 : 4;
e0c1b49f5b674c Nick Terrell 2020-09-11  572      U32* const hashTable = ms->hashTable;
e0c1b49f5b674c Nick Terrell 2020-09-11  573      size_t const h  = ZSTD_hashPtr(ip, hashLog, mls);
e0c1b49f5b674c Nick Terrell 2020-09-11  574      U32 matchIndex  = hashTable[h];
e0c1b49f5b674c Nick Terrell 2020-09-11  575      U32* const bt   = ms->chainTable;
e0c1b49f5b674c Nick Terrell 2020-09-11  576      U32 const btLog = cParams->chainLog - 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  577      U32 const btMask= (1U << btLog) - 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  578      size_t commonLengthSmaller=0, commonLengthLarger=0;
e0c1b49f5b674c Nick Terrell 2020-09-11  579      const BYTE* const dictBase = ms->window.dictBase;
e0c1b49f5b674c Nick Terrell 2020-09-11  580      U32 const dictLimit = ms->window.dictLimit;
e0c1b49f5b674c Nick Terrell 2020-09-11  581      const BYTE* const dictEnd = dictBase + dictLimit;
e0c1b49f5b674c Nick Terrell 2020-09-11  582      const BYTE* const prefixStart = base + dictLimit;
e0c1b49f5b674c Nick Terrell 2020-09-11  583      U32 const btLow = (btMask >= curr) ? 0 : curr - btMask;
e0c1b49f5b674c Nick Terrell 2020-09-11  584      U32 const windowLow = ZSTD_getLowestMatchIndex(ms, curr, cParams->windowLog);
e0c1b49f5b674c Nick Terrell 2020-09-11  585      U32 const matchLow = windowLow ? windowLow : 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  586      U32* smallerPtr = bt + 2*(curr&btMask);
e0c1b49f5b674c Nick Terrell 2020-09-11  587      U32* largerPtr  = bt + 2*(curr&btMask) + 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  588      U32 matchEndIdx = curr+8+1;   /* farthest referenced position of any match => detects repetitive patterns */
e0c1b49f5b674c Nick Terrell 2020-09-11  589      U32 dummy32;   /* to be nullified at the end */
e0c1b49f5b674c Nick Terrell 2020-09-11  590      U32 mnum = 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  591      U32 nbCompares = 1U << cParams->searchLog;
e0c1b49f5b674c Nick Terrell 2020-09-11  592  
e0c1b49f5b674c Nick Terrell 2020-09-11  593      const ZSTD_matchState_t* dms    = dictMode == ZSTD_dictMatchState ? ms->dictMatchState : NULL;
e0c1b49f5b674c Nick Terrell 2020-09-11  594      const ZSTD_compressionParameters* const dmsCParams =
e0c1b49f5b674c Nick Terrell 2020-09-11  595                                        dictMode == ZSTD_dictMatchState ? &dms->cParams : NULL;
e0c1b49f5b674c Nick Terrell 2020-09-11  596      const BYTE* const dmsBase       = dictMode == ZSTD_dictMatchState ? dms->window.base : NULL;
e0c1b49f5b674c Nick Terrell 2020-09-11  597      const BYTE* const dmsEnd        = dictMode == ZSTD_dictMatchState ? dms->window.nextSrc : NULL;
e0c1b49f5b674c Nick Terrell 2020-09-11  598      U32         const dmsHighLimit  = dictMode == ZSTD_dictMatchState ? (U32)(dmsEnd - dmsBase) : 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  599      U32         const dmsLowLimit   = dictMode == ZSTD_dictMatchState ? dms->window.lowLimit : 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  600      U32         const dmsIndexDelta = dictMode == ZSTD_dictMatchState ? windowLow - dmsHighLimit : 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  601      U32         const dmsHashLog    = dictMode == ZSTD_dictMatchState ? dmsCParams->hashLog : hashLog;
e0c1b49f5b674c Nick Terrell 2020-09-11  602      U32         const dmsBtLog      = dictMode == ZSTD_dictMatchState ? dmsCParams->chainLog - 1 : btLog;
e0c1b49f5b674c Nick Terrell 2020-09-11  603      U32         const dmsBtMask     = dictMode == ZSTD_dictMatchState ? (1U << dmsBtLog) - 1 : 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  604      U32         const dmsBtLow      = dictMode == ZSTD_dictMatchState && dmsBtMask < dmsHighLimit - dmsLowLimit ? dmsHighLimit - dmsBtMask : dmsLowLimit;
e0c1b49f5b674c Nick Terrell 2020-09-11  605  
e0c1b49f5b674c Nick Terrell 2020-09-11  606      size_t bestLength = lengthToBeat-1;
e0c1b49f5b674c Nick Terrell 2020-09-11  607      DEBUGLOG(8, "ZSTD_insertBtAndGetAllMatches: current=%u", curr);
e0c1b49f5b674c Nick Terrell 2020-09-11  608  
e0c1b49f5b674c Nick Terrell 2020-09-11  609      /* check repCode */
e0c1b49f5b674c Nick Terrell 2020-09-11  610      assert(ll0 <= 1);   /* necessarily 1 or 0 */
e0c1b49f5b674c Nick Terrell 2020-09-11  611      {   U32 const lastR = ZSTD_REP_NUM + ll0;
e0c1b49f5b674c Nick Terrell 2020-09-11  612          U32 repCode;
e0c1b49f5b674c Nick Terrell 2020-09-11  613          for (repCode = ll0; repCode < lastR; repCode++) {
e0c1b49f5b674c Nick Terrell 2020-09-11  614              U32 const repOffset = (repCode==ZSTD_REP_NUM) ? (rep[0] - 1) : rep[repCode];
e0c1b49f5b674c Nick Terrell 2020-09-11  615              U32 const repIndex = curr - repOffset;
e0c1b49f5b674c Nick Terrell 2020-09-11  616              U32 repLen = 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  617              assert(curr >= dictLimit);
e0c1b49f5b674c Nick Terrell 2020-09-11  618              if (repOffset-1 /* intentional overflow, discards 0 and -1 */ < curr-dictLimit) {  /* equivalent to `curr > repIndex >= dictLimit` */
e0c1b49f5b674c Nick Terrell 2020-09-11  619                  /* We must validate the repcode offset because when we're using a dictionary the
e0c1b49f5b674c Nick Terrell 2020-09-11  620                   * valid offset range shrinks when the dictionary goes out of bounds.
e0c1b49f5b674c Nick Terrell 2020-09-11  621                   */
e0c1b49f5b674c Nick Terrell 2020-09-11  622                  if ((repIndex >= windowLow) & (ZSTD_readMINMATCH(ip, minMatch) == ZSTD_readMINMATCH(ip - repOffset, minMatch))) {
e0c1b49f5b674c Nick Terrell 2020-09-11  623                      repLen = (U32)ZSTD_count(ip+minMatch, ip+minMatch-repOffset, iLimit) + minMatch;
e0c1b49f5b674c Nick Terrell 2020-09-11  624                  }
e0c1b49f5b674c Nick Terrell 2020-09-11  625              } else {  /* repIndex < dictLimit || repIndex >= curr */
e0c1b49f5b674c Nick Terrell 2020-09-11  626                  const BYTE* const repMatch = dictMode == ZSTD_dictMatchState ?
e0c1b49f5b674c Nick Terrell 2020-09-11  627                                               dmsBase + repIndex - dmsIndexDelta :
e0c1b49f5b674c Nick Terrell 2020-09-11  628                                               dictBase + repIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  629                  assert(curr >= windowLow);
e0c1b49f5b674c Nick Terrell 2020-09-11  630                  if ( dictMode == ZSTD_extDict
e0c1b49f5b674c Nick Terrell 2020-09-11  631                    && ( ((repOffset-1) /*intentional overflow*/ < curr - windowLow)  /* equivalent to `curr > repIndex >= windowLow` */
e0c1b49f5b674c Nick Terrell 2020-09-11  632                       & (((U32)((dictLimit-1) - repIndex) >= 3) ) /* intentional overflow : do not test positions overlapping 2 memory segments */)
e0c1b49f5b674c Nick Terrell 2020-09-11  633                    && (ZSTD_readMINMATCH(ip, minMatch) == ZSTD_readMINMATCH(repMatch, minMatch)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  634                      repLen = (U32)ZSTD_count_2segments(ip+minMatch, repMatch+minMatch, iLimit, dictEnd, prefixStart) + minMatch;
e0c1b49f5b674c Nick Terrell 2020-09-11  635                  }
e0c1b49f5b674c Nick Terrell 2020-09-11  636                  if (dictMode == ZSTD_dictMatchState
e0c1b49f5b674c Nick Terrell 2020-09-11  637                    && ( ((repOffset-1) /*intentional overflow*/ < curr - (dmsLowLimit + dmsIndexDelta))  /* equivalent to `curr > repIndex >= dmsLowLimit` */
e0c1b49f5b674c Nick Terrell 2020-09-11  638                       & ((U32)((dictLimit-1) - repIndex) >= 3) ) /* intentional overflow : do not test positions overlapping 2 memory segments */
e0c1b49f5b674c Nick Terrell 2020-09-11  639                    && (ZSTD_readMINMATCH(ip, minMatch) == ZSTD_readMINMATCH(repMatch, minMatch)) ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  640                      repLen = (U32)ZSTD_count_2segments(ip+minMatch, repMatch+minMatch, iLimit, dmsEnd, prefixStart) + minMatch;
e0c1b49f5b674c Nick Terrell 2020-09-11  641              }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  642              /* save longer solution */
e0c1b49f5b674c Nick Terrell 2020-09-11  643              if (repLen > bestLength) {
e0c1b49f5b674c Nick Terrell 2020-09-11  644                  DEBUGLOG(8, "found repCode %u (ll0:%u, offset:%u) of length %u",
e0c1b49f5b674c Nick Terrell 2020-09-11  645                              repCode, ll0, repOffset, repLen);
e0c1b49f5b674c Nick Terrell 2020-09-11  646                  bestLength = repLen;
2aa14b1ab2c41a Nick Terrell 2022-10-17  647                  matches[mnum].off = STORE_REPCODE(repCode - ll0 + 1);  /* expect value between 1 and 3 */
e0c1b49f5b674c Nick Terrell 2020-09-11  648                  matches[mnum].len = (U32)repLen;
e0c1b49f5b674c Nick Terrell 2020-09-11  649                  mnum++;
e0c1b49f5b674c Nick Terrell 2020-09-11  650                  if ( (repLen > sufficient_len)
e0c1b49f5b674c Nick Terrell 2020-09-11  651                     | (ip+repLen == iLimit) ) {  /* best possible */
e0c1b49f5b674c Nick Terrell 2020-09-11  652                      return mnum;
e0c1b49f5b674c Nick Terrell 2020-09-11  653      }   }   }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  654  
e0c1b49f5b674c Nick Terrell 2020-09-11  655      /* HC3 match finder */
e0c1b49f5b674c Nick Terrell 2020-09-11  656      if ((mls == 3) /*static*/ && (bestLength < mls)) {
e0c1b49f5b674c Nick Terrell 2020-09-11  657          U32 const matchIndex3 = ZSTD_insertAndFindFirstIndexHash3(ms, nextToUpdate3, ip);
e0c1b49f5b674c Nick Terrell 2020-09-11  658          if ((matchIndex3 >= matchLow)
e0c1b49f5b674c Nick Terrell 2020-09-11  659            & (curr - matchIndex3 < (1<<18)) /*heuristic : longer distance likely too expensive*/ ) {
e0c1b49f5b674c Nick Terrell 2020-09-11  660              size_t mlen;
e0c1b49f5b674c Nick Terrell 2020-09-11  661              if ((dictMode == ZSTD_noDict) /*static*/ || (dictMode == ZSTD_dictMatchState) /*static*/ || (matchIndex3 >= dictLimit)) {
e0c1b49f5b674c Nick Terrell 2020-09-11  662                  const BYTE* const match = base + matchIndex3;
e0c1b49f5b674c Nick Terrell 2020-09-11  663                  mlen = ZSTD_count(ip, match, iLimit);
e0c1b49f5b674c Nick Terrell 2020-09-11  664              } else {
e0c1b49f5b674c Nick Terrell 2020-09-11  665                  const BYTE* const match = dictBase + matchIndex3;
e0c1b49f5b674c Nick Terrell 2020-09-11  666                  mlen = ZSTD_count_2segments(ip, match, iLimit, dictEnd, prefixStart);
e0c1b49f5b674c Nick Terrell 2020-09-11  667              }
e0c1b49f5b674c Nick Terrell 2020-09-11  668  
e0c1b49f5b674c Nick Terrell 2020-09-11  669              /* save best solution */
e0c1b49f5b674c Nick Terrell 2020-09-11  670              if (mlen >= mls /* == 3 > bestLength */) {
e0c1b49f5b674c Nick Terrell 2020-09-11  671                  DEBUGLOG(8, "found small match with hlog3, of length %u",
e0c1b49f5b674c Nick Terrell 2020-09-11  672                              (U32)mlen);
e0c1b49f5b674c Nick Terrell 2020-09-11  673                  bestLength = mlen;
e0c1b49f5b674c Nick Terrell 2020-09-11  674                  assert(curr > matchIndex3);
e0c1b49f5b674c Nick Terrell 2020-09-11  675                  assert(mnum==0);  /* no prior solution */
2aa14b1ab2c41a Nick Terrell 2022-10-17  676                  matches[0].off = STORE_OFFSET(curr - matchIndex3);
e0c1b49f5b674c Nick Terrell 2020-09-11  677                  matches[0].len = (U32)mlen;
e0c1b49f5b674c Nick Terrell 2020-09-11  678                  mnum = 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  679                  if ( (mlen > sufficient_len) |
e0c1b49f5b674c Nick Terrell 2020-09-11  680                       (ip+mlen == iLimit) ) {  /* best possible length */
e0c1b49f5b674c Nick Terrell 2020-09-11  681                      ms->nextToUpdate = curr+1;  /* skip insertion */
e0c1b49f5b674c Nick Terrell 2020-09-11  682                      return 1;
e0c1b49f5b674c Nick Terrell 2020-09-11  683          }   }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  684          /* no dictMatchState lookup: dicts don't have a populated HC3 table */
2aa14b1ab2c41a Nick Terrell 2022-10-17  685      }  /* if (mls == 3) */
e0c1b49f5b674c Nick Terrell 2020-09-11  686  
e0c1b49f5b674c Nick Terrell 2020-09-11  687      hashTable[h] = curr;   /* Update Hash Table */
e0c1b49f5b674c Nick Terrell 2020-09-11  688  
e0c1b49f5b674c Nick Terrell 2020-09-11  689      for (; nbCompares && (matchIndex >= matchLow); --nbCompares) {
e0c1b49f5b674c Nick Terrell 2020-09-11  690          U32* const nextPtr = bt + 2*(matchIndex & btMask);
e0c1b49f5b674c Nick Terrell 2020-09-11  691          const BYTE* match;
e0c1b49f5b674c Nick Terrell 2020-09-11  692          size_t matchLength = MIN(commonLengthSmaller, commonLengthLarger);   /* guaranteed minimum nb of common bytes */
e0c1b49f5b674c Nick Terrell 2020-09-11  693          assert(curr > matchIndex);
e0c1b49f5b674c Nick Terrell 2020-09-11  694  
e0c1b49f5b674c Nick Terrell 2020-09-11  695          if ((dictMode == ZSTD_noDict) || (dictMode == ZSTD_dictMatchState) || (matchIndex+matchLength >= dictLimit)) {
e0c1b49f5b674c Nick Terrell 2020-09-11  696              assert(matchIndex+matchLength >= dictLimit);  /* ensure the condition is correct when !extDict */
e0c1b49f5b674c Nick Terrell 2020-09-11  697              match = base + matchIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11 @698              if (matchIndex >= dictLimit) assert(memcmp(match, ip, matchLength) == 0);  /* ensure early section of match is equal as expected */
e0c1b49f5b674c Nick Terrell 2020-09-11  699              matchLength += ZSTD_count(ip+matchLength, match+matchLength, iLimit);
e0c1b49f5b674c Nick Terrell 2020-09-11  700          } else {
e0c1b49f5b674c Nick Terrell 2020-09-11  701              match = dictBase + matchIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  702              assert(memcmp(match, ip, matchLength) == 0);  /* ensure early section of match is equal as expected */
e0c1b49f5b674c Nick Terrell 2020-09-11  703              matchLength += ZSTD_count_2segments(ip+matchLength, match+matchLength, iLimit, dictEnd, prefixStart);
e0c1b49f5b674c Nick Terrell 2020-09-11  704              if (matchIndex+matchLength >= dictLimit)
e0c1b49f5b674c Nick Terrell 2020-09-11  705                  match = base + matchIndex;   /* prepare for match[matchLength] read */
e0c1b49f5b674c Nick Terrell 2020-09-11  706          }
e0c1b49f5b674c Nick Terrell 2020-09-11  707  
e0c1b49f5b674c Nick Terrell 2020-09-11  708          if (matchLength > bestLength) {
e0c1b49f5b674c Nick Terrell 2020-09-11  709              DEBUGLOG(8, "found match of length %u at distance %u (offCode=%u)",
2aa14b1ab2c41a Nick Terrell 2022-10-17  710                      (U32)matchLength, curr - matchIndex, STORE_OFFSET(curr - matchIndex));
e0c1b49f5b674c Nick Terrell 2020-09-11  711              assert(matchEndIdx > matchIndex);
e0c1b49f5b674c Nick Terrell 2020-09-11  712              if (matchLength > matchEndIdx - matchIndex)
e0c1b49f5b674c Nick Terrell 2020-09-11  713                  matchEndIdx = matchIndex + (U32)matchLength;
e0c1b49f5b674c Nick Terrell 2020-09-11  714              bestLength = matchLength;
2aa14b1ab2c41a Nick Terrell 2022-10-17  715              matches[mnum].off = STORE_OFFSET(curr - matchIndex);
e0c1b49f5b674c Nick Terrell 2020-09-11  716              matches[mnum].len = (U32)matchLength;
e0c1b49f5b674c Nick Terrell 2020-09-11  717              mnum++;
e0c1b49f5b674c Nick Terrell 2020-09-11  718              if ( (matchLength > ZSTD_OPT_NUM)
e0c1b49f5b674c Nick Terrell 2020-09-11  719                 | (ip+matchLength == iLimit) /* equal : no way to know if inf or sup */) {
e0c1b49f5b674c Nick Terrell 2020-09-11  720                  if (dictMode == ZSTD_dictMatchState) nbCompares = 0; /* break should also skip searching dms */
e0c1b49f5b674c Nick Terrell 2020-09-11  721                  break; /* drop, to preserve bt consistency (miss a little bit of compression) */
2aa14b1ab2c41a Nick Terrell 2022-10-17  722          }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  723  
e0c1b49f5b674c Nick Terrell 2020-09-11  724          if (match[matchLength] < ip[matchLength]) {
e0c1b49f5b674c Nick Terrell 2020-09-11  725              /* match smaller than current */
e0c1b49f5b674c Nick Terrell 2020-09-11  726              *smallerPtr = matchIndex;             /* update smaller idx */
e0c1b49f5b674c Nick Terrell 2020-09-11  727              commonLengthSmaller = matchLength;    /* all smaller will now have at least this guaranteed common length */
e0c1b49f5b674c Nick Terrell 2020-09-11  728              if (matchIndex <= btLow) { smallerPtr=&dummy32; break; }   /* beyond tree size, stop the search */
e0c1b49f5b674c Nick Terrell 2020-09-11  729              smallerPtr = nextPtr+1;               /* new candidate => larger than match, which was smaller than current */
e0c1b49f5b674c Nick Terrell 2020-09-11  730              matchIndex = nextPtr[1];              /* new matchIndex, larger than previous, closer to current */
e0c1b49f5b674c Nick Terrell 2020-09-11  731          } else {
e0c1b49f5b674c Nick Terrell 2020-09-11  732              *largerPtr = matchIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  733              commonLengthLarger = matchLength;
e0c1b49f5b674c Nick Terrell 2020-09-11  734              if (matchIndex <= btLow) { largerPtr=&dummy32; break; }   /* beyond tree size, stop the search */
e0c1b49f5b674c Nick Terrell 2020-09-11  735              largerPtr = nextPtr;
e0c1b49f5b674c Nick Terrell 2020-09-11  736              matchIndex = nextPtr[0];
e0c1b49f5b674c Nick Terrell 2020-09-11  737      }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  738  
e0c1b49f5b674c Nick Terrell 2020-09-11  739      *smallerPtr = *largerPtr = 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  740  
e0c1b49f5b674c Nick Terrell 2020-09-11  741      assert(nbCompares <= (1U << ZSTD_SEARCHLOG_MAX)); /* Check we haven't underflowed. */
e0c1b49f5b674c Nick Terrell 2020-09-11  742      if (dictMode == ZSTD_dictMatchState && nbCompares) {
e0c1b49f5b674c Nick Terrell 2020-09-11  743          size_t const dmsH = ZSTD_hashPtr(ip, dmsHashLog, mls);
e0c1b49f5b674c Nick Terrell 2020-09-11  744          U32 dictMatchIndex = dms->hashTable[dmsH];
e0c1b49f5b674c Nick Terrell 2020-09-11  745          const U32* const dmsBt = dms->chainTable;
e0c1b49f5b674c Nick Terrell 2020-09-11  746          commonLengthSmaller = commonLengthLarger = 0;
e0c1b49f5b674c Nick Terrell 2020-09-11  747          for (; nbCompares && (dictMatchIndex > dmsLowLimit); --nbCompares) {
e0c1b49f5b674c Nick Terrell 2020-09-11  748              const U32* const nextPtr = dmsBt + 2*(dictMatchIndex & dmsBtMask);
e0c1b49f5b674c Nick Terrell 2020-09-11  749              size_t matchLength = MIN(commonLengthSmaller, commonLengthLarger);   /* guaranteed minimum nb of common bytes */
e0c1b49f5b674c Nick Terrell 2020-09-11  750              const BYTE* match = dmsBase + dictMatchIndex;
e0c1b49f5b674c Nick Terrell 2020-09-11  751              matchLength += ZSTD_count_2segments(ip+matchLength, match+matchLength, iLimit, dmsEnd, prefixStart);
e0c1b49f5b674c Nick Terrell 2020-09-11  752              if (dictMatchIndex+matchLength >= dmsHighLimit)
e0c1b49f5b674c Nick Terrell 2020-09-11  753                  match = base + dictMatchIndex + dmsIndexDelta;   /* to prepare for next usage of match[matchLength] */
e0c1b49f5b674c Nick Terrell 2020-09-11  754  
e0c1b49f5b674c Nick Terrell 2020-09-11  755              if (matchLength > bestLength) {
e0c1b49f5b674c Nick Terrell 2020-09-11  756                  matchIndex = dictMatchIndex + dmsIndexDelta;
e0c1b49f5b674c Nick Terrell 2020-09-11  757                  DEBUGLOG(8, "found dms match of length %u at distance %u (offCode=%u)",
2aa14b1ab2c41a Nick Terrell 2022-10-17  758                          (U32)matchLength, curr - matchIndex, STORE_OFFSET(curr - matchIndex));
e0c1b49f5b674c Nick Terrell 2020-09-11  759                  if (matchLength > matchEndIdx - matchIndex)
e0c1b49f5b674c Nick Terrell 2020-09-11  760                      matchEndIdx = matchIndex + (U32)matchLength;
e0c1b49f5b674c Nick Terrell 2020-09-11  761                  bestLength = matchLength;
2aa14b1ab2c41a Nick Terrell 2022-10-17  762                  matches[mnum].off = STORE_OFFSET(curr - matchIndex);
e0c1b49f5b674c Nick Terrell 2020-09-11  763                  matches[mnum].len = (U32)matchLength;
e0c1b49f5b674c Nick Terrell 2020-09-11  764                  mnum++;
e0c1b49f5b674c Nick Terrell 2020-09-11  765                  if ( (matchLength > ZSTD_OPT_NUM)
e0c1b49f5b674c Nick Terrell 2020-09-11  766                     | (ip+matchLength == iLimit) /* equal : no way to know if inf or sup */) {
e0c1b49f5b674c Nick Terrell 2020-09-11  767                      break;   /* drop, to guarantee consistency (miss a little bit of compression) */
2aa14b1ab2c41a Nick Terrell 2022-10-17  768              }   }
e0c1b49f5b674c Nick Terrell 2020-09-11  769  
e0c1b49f5b674c Nick Terrell 2020-09-11  770              if (dictMatchIndex <= dmsBtLow) { break; }   /* beyond tree size, stop the search */
e0c1b49f5b674c Nick Terrell 2020-09-11  771              if (match[matchLength] < ip[matchLength]) {
e0c1b49f5b674c Nick Terrell 2020-09-11  772                  commonLengthSmaller = matchLength;    /* all smaller will now have at least this guaranteed common length */
e0c1b49f5b674c Nick Terrell 2020-09-11  773                  dictMatchIndex = nextPtr[1];              /* new matchIndex larger than previous (closer to current) */
e0c1b49f5b674c Nick Terrell 2020-09-11  774              } else {
e0c1b49f5b674c Nick Terrell 2020-09-11  775                  /* match is larger than current */
e0c1b49f5b674c Nick Terrell 2020-09-11  776                  commonLengthLarger = matchLength;
e0c1b49f5b674c Nick Terrell 2020-09-11  777                  dictMatchIndex = nextPtr[0];
2aa14b1ab2c41a Nick Terrell 2022-10-17  778      }   }   }  /* if (dictMode == ZSTD_dictMatchState) */
e0c1b49f5b674c Nick Terrell 2020-09-11  779  
e0c1b49f5b674c Nick Terrell 2020-09-11  780      assert(matchEndIdx > curr+8);
e0c1b49f5b674c Nick Terrell 2020-09-11  781      ms->nextToUpdate = matchEndIdx - 8;  /* skip repetitive patterns */
e0c1b49f5b674c Nick Terrell 2020-09-11  782      return mnum;
e0c1b49f5b674c Nick Terrell 2020-09-11  783  }
e0c1b49f5b674c Nick Terrell 2020-09-11  784  

:::::: The code at line 698 was first introduced by commit
:::::: e0c1b49f5b674cca7b10549c53b3791d0bbc90a8 lib: zstd: Upgrade to latest upstream zstd version 1.4.10

:::::: TO: Nick Terrell <terrelln@fb.com>
:::::: CC: Nick Terrell <terrelln@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
