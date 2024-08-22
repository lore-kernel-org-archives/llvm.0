Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3F01CB138;
	Thu, 22 Aug 2024 17:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348776; cv=none; b=PmGGe3EseExb1SrdF4yT5oqfTOkW9VeL+NePbUPh8ayxy2Ff79XTQzj60apyvn0iWKEFQ+LK2kpgYdTW0LvbLOI1zgAdhi+DRZMTOkz3jPjEJYHjx0yoYZB7uttzlN+irOGhtRSY2x2gD4AawbFC+Q0DurbabuKKU0Ffi8BvqoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348776; c=relaxed/simple;
	bh=7EQIYt13u1ufOn0dF1PhuSW3G9j8s6yiwX8zR1k49pA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=THeniguDQr9vQCEZW7MAmH56sSxp1A2uQimnGkTZ4qq4rq9qLbL1UvrRkCuGyY6O0QLv6yNrE0zupEEOvvJIv80cWCXlAt0zUQyU7eGtEBWRqqOa66BABVjbr2dj1ifcUZohnTXui/7bhCvpfgNckJgr4qpzduHDNA+xHEalnlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=rjIRlRAW; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="rjIRlRAW"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4WqVxL0s38zlgVnK;
	Thu, 22 Aug 2024 17:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1724348770; x=1726940771; bh=qVK2FiFnMtuvYu+bq3EtpqrT
	EJKTYCISPvN6V8lWiH0=; b=rjIRlRAWMp1mLl8huNJw04AxzHjl8qwfa60jFyHX
	y5QMl5Y23U5WyZt4AxAvW5v4JIQziLCey34xh1sz/GNi3XZ887wXsc+tZexp5QU8
	s7SZWCWNO56uaizkMImAJMYQLE/zqJY6OGJwAJ5gL5vb2pmjoakdUavO3zp/mETS
	LKXEsZk4SnkGu/L5KjjySZNQSYS0ZeEM3zUZ7gols6pyrJXIcakcnO+LpKtiVtTL
	6sDMUxLPtv/RfkUlR1Loh4f8fCfc3xBXRo0XLVERhWuhtrmf43gLbh+ETrSh9kZw
	3YpmDtTPL1oSBpxTL3YSAUPhcymnr4X6S1rYpDk6mbGk1Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id nJM9SFjvr3SX; Thu, 22 Aug 2024 17:46:10 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4WqVxF02qtzlgVnF;
	Thu, 22 Aug 2024 17:46:08 +0000 (UTC)
Message-ID: <f67e8c72-2413-444e-b8c3-745ae78fb38c@acm.org>
Date: Thu, 22 Aug 2024 10:46:07 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] ufs: core: Move the ufshcd_device_init() call
To: kernel test robot <lkp@intel.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-scsi@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Peter Wang <peter.wang@mediatek.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Avri Altman <avri.altman@wdc.com>, Bean Huo <beanhuo@micron.com>,
 Andrew Halaney <ahalaney@redhat.com>
References: <20240819225102.2437307-6-bvanassche@acm.org>
 <202408222305.wOhpxPXn-lkp@intel.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <202408222305.wOhpxPXn-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/24 9:07 AM, kernel test robot wrote:
>>> drivers/ufs/core/ufshcd.c:8871:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]

I plan to fix this compiler warning by combining the following change
into patch 5/9:

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 9af293b39672..313b62509162 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8832,7 +8832,7 @@ static int ufshcd_probe_hba(struct ufs_hba *hba)
  {
         ktime_t start = ktime_get();
         unsigned long flags;
-       int ret;
+       int ret = 0;

         if (!hba->pm_op_in_progress &&
             (hba->quirks & UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH)) {

Bart.
