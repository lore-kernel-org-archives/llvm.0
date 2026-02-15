Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E356261388;
	Sun, 15 Feb 2026 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771161554; cv=none; b=BFiLvTHFOO/hXYVveElCLCq9xwc82/VbrLsI+BEB46Q586uPD5wFf52Y2TFdNBf2GGIlt480bWn5c3Zjybx3JI5Rusy5zNMTUS2i2Iihwv2OeibDYmdYaz0mlYAkta0b/5oDU86pRbOKFhUsKa3Hc5Z9Cj5YP8Pqng6ZkvAbYUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771161554; c=relaxed/simple;
	bh=o1NCRDTHm6HEjVt+1zrWXj2FcyaT7ZSb1LnbFZCrK6o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nCYSNuDGQWKyPO365/RmVNMGBsJgI180qYSOzLo64tPiU/mx/iL7F1hX6s/OMvkOCkvhM/wmfAClqssEJol++e1EXje2fpJ+ubdNo5dKk1cbxCqU01t6K25Tcsa0BGubkfxGrx8yuDnzG8il9kSy5iq+pr2Uijh2AC4AuyZ/wkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGkOqBf0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGkOqBf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771161552; x=1802697552;
  h=date:from:to:cc:subject:message-id;
  bh=o1NCRDTHm6HEjVt+1zrWXj2FcyaT7ZSb1LnbFZCrK6o=;
  b=SGkOqBf0YzM1ag+sGuLqpRUR0nFiO6xrSQQ9MsbgGTjdU4VnBV0Bk8GF
   Sgmx4K9wGETzQS1DPAqfR4d/kQxCj1e0yUo9V2gbTl1ON68PCcKPi3DiW
   TdZX8DAIrMO4cjwJYCq/O2Hb0DuaYpd/imZ6Tt3AvfxwMGveKR6/0w0EU
   wT0xlR0p3iSdFZwEoUSUttdxhBLf9YO/huqHLZJlTLemk94WY60q+PwlI
   Xf62i9csAEB0hDz2TnvyTVuTq4COAe9UiIF3uLMt598Jzmy1iNoN4ed4E
   C6IoQWz+tK0sXyehpK5QHF9IseM+Zro62KZ1fTYMI7t1re2qQpChLX4cS
   g==;
X-CSE-ConnectionGUID: HMufS+UnSnqcUpxwEWy3cg==
X-CSE-MsgGUID: U5aWh2gyQwSlNQ0O+wiaqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71470181"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="71470181"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 05:19:12 -0800
X-CSE-ConnectionGUID: R6QM3bqQRLagBdT+LgO15A==
X-CSE-MsgGUID: C7SWQX2/Qb+ZDVt6ixNpRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="212601673"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 15 Feb 2026 05:19:10 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrc1j-0000000027N-2qXH;
	Sun, 15 Feb 2026 13:19:07 +0000
Date: Sun, 15 Feb 2026 14:18:39 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-aes 6/10] fs/smb/client/cifs_unicode.c:195:13:
 error: call to undeclared function 'get_unaligned_le16'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202602151406.eZcaINgz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes
head:   1ec222c94bbd407081e99e0efbbfbc5e9c258ee7
commit: c3c35f7367a6e4195dbd41f3287c4fed5e52e472 [6/10] smb: client: Use AES-CMAC library for SMB3 signature calculation
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260215/202602151406.eZcaINgz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151406.eZcaINgz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151406.eZcaINgz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/client/cifs_unicode.c:195:13: error: call to undeclared function 'get_unaligned_le16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     195 |                 ftmp[0] = get_unaligned_le16(&from[i]);
         |                           ^
>> fs/smb/client/cifs_unicode.c:284:3: error: call to undeclared function 'put_unaligned_le16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |                 put_unaligned_le16(wchar_to, &to[i]);
         |                 ^
   fs/smb/client/cifs_unicode.c:288:2: error: call to undeclared function 'put_unaligned_le16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     288 |         put_unaligned_le16(0, &to[i]);
         |         ^
   fs/smb/client/cifs_unicode.c:313:13: error: call to undeclared function 'get_unaligned_le16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     313 |                 ftmp[0] = get_unaligned_le16(&from[i]);
         |                           ^
>> fs/smb/client/cifs_unicode.c:543:5: error: call to undeclared function 'put_unaligned'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     543 |                                 put_unaligned(dst_char, &target[j]);
         |                                 ^
   fs/smb/client/cifs_unicode.c:575:3: error: call to undeclared function 'put_unaligned'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     575 |                 put_unaligned(dst_char, &target[j]);
         |                 ^
   fs/smb/client/cifs_unicode.c:579:2: error: call to undeclared function 'put_unaligned'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     579 |         put_unaligned(0, &target[j]); /* Null terminate target unicode string */
         |         ^
   7 errors generated.


vim +/get_unaligned_le16 +195 fs/smb/client/cifs_unicode.c

7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  152  
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  153  /*
acbbb76a26648d fs/cifs/cifs_unicode.c Steve French    2012-01-18  154   * cifs_from_utf16 - convert utf16le string to local charset
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  155   * @to - destination buffer
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  156   * @from - source buffer
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  157   * @tolen - destination buffer size (in bytes)
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  158   * @fromlen - source buffer size (in bytes)
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  159   * @codepage - codepage to which characters should be converted
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  160   * @mapchar - should characters be remapped according to the mapchars option?
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  161   *
acbbb76a26648d fs/cifs/cifs_unicode.c Steve French    2012-01-18  162   * Convert a little-endian utf16le string (as sent by the server) to a string
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  163   * in the provided codepage. The tolen and fromlen parameters are to ensure
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  164   * that the code doesn't walk off of the end of the buffer (which is always
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  165   * a danger if the alignment of the source buffer is off). The destination
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  166   * string is always properly null terminated and fits in the destination
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  167   * buffer. Returns the length of the destination string in bytes (including
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  168   * null terminator).
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  169   *
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  170   * Note that some windows versions actually send multiword UTF-16 characters
acbbb76a26648d fs/cifs/cifs_unicode.c Steve French    2012-01-18  171   * instead of straight UTF16-2. The linux nls routines however aren't able to
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  172   * deal with those characters properly. In the event that we get some of
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  173   * those characters, they won't be translated properly.
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  174   */
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  175  int
acbbb76a26648d fs/cifs/cifs_unicode.c Steve French    2012-01-18  176  cifs_from_utf16(char *to, const __le16 *from, int tolen, int fromlen,
b693855fe67314 fs/cifs/cifs_unicode.c Steve French    2014-09-25  177  		const struct nls_table *codepage, int map_type)
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  178  {
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  179  	int i, charlen, safelen;
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  180  	int outlen = 0;
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  181  	int nullsize = nls_nullsize(codepage);
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  182  	int fromwords = fromlen / 2;
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  183  	char tmp[NLS_MAX_CHARSET_SIZE];
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  184  	__u16 ftmp[3];		/* ftmp[3] = 3array x 2bytes = 6bytes UTF-16 */
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  185  
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  186  	/*
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  187  	 * because the chars can be of varying widths, we need to take care
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  188  	 * not to overflow the destination buffer when we get close to the
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  189  	 * end of it. Until we get to this offset, we don't need to check
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  190  	 * for overflow however.
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  191  	 */
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  192  	safelen = tolen - (NLS_MAX_CHARSET_SIZE + nullsize);
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  193  
ba2dbf30df210b fs/cifs/cifs_unicode.c Jeff Layton     2011-01-20  194  	for (i = 0; i < fromwords; i++) {
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09 @195  		ftmp[0] = get_unaligned_le16(&from[i]);
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  196  		if (ftmp[0] == 0)
ba2dbf30df210b fs/cifs/cifs_unicode.c Jeff Layton     2011-01-20  197  			break;
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  198  		if (i + 1 < fromwords)
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  199  			ftmp[1] = get_unaligned_le16(&from[i + 1]);
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  200  		else
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  201  			ftmp[1] = 0;
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  202  		if (i + 2 < fromwords)
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  203  			ftmp[2] = get_unaligned_le16(&from[i + 2]);
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  204  		else
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  205  			ftmp[2] = 0;
ba2dbf30df210b fs/cifs/cifs_unicode.c Jeff Layton     2011-01-20  206  
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  207  		/*
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  208  		 * check to see if converting this character might make the
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  209  		 * conversion bleed into the null terminator
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  210  		 */
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  211  		if (outlen >= safelen) {
b693855fe67314 fs/cifs/cifs_unicode.c Steve French    2014-09-25  212  			charlen = cifs_mapchar(tmp, ftmp, codepage, map_type);
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  213  			if ((outlen + charlen) > (tolen - nullsize))
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  214  				break;
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  215  		}
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  216  
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  217  		/* put converted char into 'to' buffer */
b693855fe67314 fs/cifs/cifs_unicode.c Steve French    2014-09-25  218  		charlen = cifs_mapchar(&to[outlen], ftmp, codepage, map_type);
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  219  		outlen += charlen;
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  220  
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  221  		/* charlen (=bytes of UTF-8 for 1 character)
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  222  		 * 4bytes UTF-8(surrogate pair) is charlen=4
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  223  		 *   (4bytes UTF-16 code)
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  224  		 * 7-8bytes UTF-8(IVS) is charlen=3+4 or 4+4
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  225  		 *   (2 UTF-8 pairs divided to 2 UTF-16 pairs) */
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  226  		if (charlen == 4)
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  227  			i++;
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  228  		else if (charlen >= 5)
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  229  			/* 5-6bytes UTF-8 */
b29103076bec83 fs/cifs/cifs_unicode.c Nakajima Akira  2015-04-09  230  			i += 2;
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  231  	}
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  232  
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  233  	/* properly null-terminate string */
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  234  	for (i = 0; i < nullsize; i++)
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  235  		to[outlen++] = 0;
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  236  
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  237  	return outlen;
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  238  }
7fabf0c9479fef fs/cifs/cifs_unicode.c Jeff Layton     2009-04-30  239  
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  240  /*
acbbb76a26648d fs/cifs/cifs_unicode.c Steve French    2012-01-18  241   * NAME:	cifs_strtoUTF16()
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  242   *
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  243   * FUNCTION:	Convert character string to unicode string
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  244   *
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  245   */
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  246  int
acbbb76a26648d fs/cifs/cifs_unicode.c Steve French    2012-01-18  247  cifs_strtoUTF16(__le16 *to, const char *from, int len,
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  248  	      const struct nls_table *codepage)
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  249  {
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  250  	int charlen;
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  251  	int i;
ba2dbf30df210b fs/cifs/cifs_unicode.c Jeff Layton     2011-01-20  252  	wchar_t wchar_to; /* needed to quiet sparse */
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  253  
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  254  	/* special case for utf8 to handle no plane0 chars */
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  255  	if (!strcmp(codepage->charset, "utf8")) {
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  256  		/*
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  257  		 * convert utf8 -> utf16, we assume we have enough space
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  258  		 * as caller should have assumed conversion does not overflow
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  259  		 * in destination len is length in wchar_t units (16bits)
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  260  		 */
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  261  		i  = utf8s_to_utf16s(from, len, UTF16_LITTLE_ENDIAN,
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  262  				       (wchar_t *) to, len);
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  263  
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  264  		/* if success terminate and exit */
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  265  		if (i >= 0)
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  266  			goto success;
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  267  		/*
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  268  		 * if fails fall back to UCS encoding as this
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  269  		 * function should not return negative values
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  270  		 * currently can fail only if source contains
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  271  		 * invalid encoded characters
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  272  		 */
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  273  	}
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  274  
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  275  	for (i = 0; len && *from; i++, from += charlen, len -= charlen) {
ba2dbf30df210b fs/cifs/cifs_unicode.c Jeff Layton     2011-01-20  276  		charlen = codepage->char2uni(from, len, &wchar_to);
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  277  		if (charlen < 1) {
f96637be081141 fs/cifs/cifs_unicode.c Joe Perches     2013-05-04  278  			cifs_dbg(VFS, "strtoUTF16: char2uni of 0x%x returned %d\n",
ba2dbf30df210b fs/cifs/cifs_unicode.c Jeff Layton     2011-01-20  279  				 *from, charlen);
69114089b75e03 fs/cifs/cifs_unicode.c Steve French    2005-11-10  280  			/* A question mark */
ba2dbf30df210b fs/cifs/cifs_unicode.c Jeff Layton     2011-01-20  281  			wchar_to = 0x003f;
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  282  			charlen = 1;
ba2dbf30df210b fs/cifs/cifs_unicode.c Jeff Layton     2011-01-20  283  		}
ba2dbf30df210b fs/cifs/cifs_unicode.c Jeff Layton     2011-01-20 @284  		put_unaligned_le16(wchar_to, &to[i]);
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  285  	}
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  286  
fd3ba42c76d3d4 fs/cifs/cifs_unicode.c Frediano Ziglio 2012-08-07  287  success:
ba2dbf30df210b fs/cifs/cifs_unicode.c Jeff Layton     2011-01-20  288  	put_unaligned_le16(0, &to[i]);
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  289  	return i;
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  290  }
^1da177e4c3f41 fs/cifs/cifs_unicode.c Linus Torvalds  2005-04-16  291  

:::::: The code at line 195 was first introduced by commit
:::::: b29103076bec8316e155e71309dc0fba499022c6 Fix to convert SURROGATE PAIR

:::::: TO: Nakajima Akira <nakajima.akira@nttcom.co.jp>
:::::: CC: Steve French <smfrench@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
