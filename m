Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9A01EE001;
	Tue,  7 Jan 2025 11:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249684; cv=none; b=UDC173FiMNjQGxZ/pKU5dcVF4N1z9AB786zyei6JYL/U8HVpRz/l4AA5g2fzNz5PKIoyANwdDUn4UuxQOdNc215kzceCKCZyUKSMwz4Ed8axljoDOU5KF2uKZFqE/AGwd7+53O8EUYH4xJ+sBFho+g1A5t8KbGEokddViJXK2y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249684; c=relaxed/simple;
	bh=suOCC3qQjz4Rro4d5aJv6tfadxbWT7yNBxDGT5QwFpg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZFPYzHP3WqI0JbbTs87/2aBEjC6uTG4RTTL3CjPGJzZu3mPLA8sM4mbtjAwHvg67pTty7yEU7x4fkU0iNX+oz6dBVAHTM+siWWBwun9eEsPROOPxXLwgnXeWJjbftwDMBC7hKwFK+lWyj1Cb0RN85mQU5mqpWk99DYXk4rp5Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=E76Hmbmr; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="E76Hmbmr"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50767dL3015988;
	Tue, 7 Jan 2025 05:34:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=eWtZjNkyoKWLrdts5R
	RbVgqLzSUZXQfe6PCBBKJbIX8=; b=E76Hmbmr1rMy+eZgyWDTM8UZ5hy6qkw1ug
	1eqUJ6PKuq8FNS5VtpdsVRSdCaIgvWuWZCNSGepzzwp+cbzUnzeIy+h2J41Qh99W
	fV1kvXL5g4IFh+ct6tCOtQrgP6Yp9fH+N0O/fiCtVcqu9dQNBidi+pWyHiDXVb7I
	+EPuQIBWI0oE/rbE1BbH6skuT+vvAB+xHUQW8pve+ItnYwpSRqfWaOsGC3CCIuKt
	fOu+2fp3GIa4JPuRSAKLQMLcjsJ1RoIqGtcc+c0f+nJvCewlbAwW+SrGgxMWcB+w
	YN6KtSzwjPC08VTMLO0z9+H17XGTxce9pS4qDMlxJgd5HcQIknDw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29kb7js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 05:34:37 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 7 Jan
 2025 11:34:36 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Tue, 7 Jan 2025 11:34:36 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id F20EA820248;
	Tue,  7 Jan 2025 11:34:35 +0000 (UTC)
Date: Tue, 7 Jan 2025 11:34:34 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: kernel test robot <lkp@intel.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
        Mark Brown
	<broonie@kernel.org>
Subject: Re:
 [broonie-ci:20241217_ckeepax_expand_soundwire_mbq_register_map_support 4/4]
 drivers/base/regmap/regmap-sdw-mbq.c:57:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <Z30RSqZEuqJ66Jsj@opensource.cirrus.com>
References: <202501071455.Gv6kl3eR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202501071455.Gv6kl3eR-lkp@intel.com>
X-Proofpoint-ORIG-GUID: PnMlgRNXSspP3-o1SvniOaqmYWe2A18T
X-Proofpoint-GUID: PnMlgRNXSspP3-o1SvniOaqmYWe2A18T
X-Proofpoint-Spam-Reason: safe

On Tue, Jan 07, 2025 at 03:06:49PM +0800, kernel test robot wrote:
>    drivers/base/regmap/regmap-sdw-mbq.c:50:14: note: initialize the variable 'ret' to silence this warning
>       50 |         int val, ret;
>          |                     ^
>          |                      = 0
>    1 warning generated.

Apologies for the oversight. I have a couple suggestions from
Shuming Fan to add as well, I should be able to get a respin out
today at some point.

Thanks,
Charles
