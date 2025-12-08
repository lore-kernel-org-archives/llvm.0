Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135972E9EA1;
	Mon,  8 Dec 2025 13:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765201170; cv=none; b=LBFJHe06BkLcaJNS5Ue210tkGBNUAlt2rlb61kxP20NdixJiwl7hYTGz0a5kKeNAVDis3RXv/+6AJBPnVaUHkssQebC5KKMuB98uMt6jMKtEuCPLwr2ZQsaa1CndOcbLl76SzeN0FgBmKxCruKBNlaoyeQprnFSiyo/3y98kclI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765201170; c=relaxed/simple;
	bh=xa0Vf7rsKrwtjRTCIbZCv/G9XXw5k8CfjE52u5X7tC4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=lbSMFjJ/vQWPO/RBiyVE1AdzPNzRGZ0qJBcumhPWpzeKPx65wZvQ1AhKRyAItBydtfsxUYgXc6b4cra5mW1JW7DU3JBGBeSAobRpzOm+sdV+x/j7mtnn9zzG+DfSovx3EsbCOYeQRmVGh8Ulgi+UGYVOPAPOemKAwBoODr4JgC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=oP1KyHTl; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="oP1KyHTl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=D9HEMEu4jow30a0eTLJDvnZILdk2Yg3oq/SuDNrQf7k=; b=oP1KyHTlwp64jhNc0fntiagBEc
	9eDPSEIyVnUkp8q7FI5c/UOFUw5sepBxaX+xCan5q4CzZqgpF9+c1AbiD6tMCWtLZVYYTc3sFNip4
	7GChPfoq2HnC/5sdGxoBy/p78QZZmby8Zs9KNwwhUCidgn3h1Fy1LCKqKbQdEoZrytmyYC7oJV2oe
	9WyadhoI1USXVW/+YnSKuX3euPqlDAucYnGgtWJO2AsTaltAJ6R5GND0YvWd/PklK0wHgeALoZAgF
	D7IX8KQqL5F2RUXz+VUfiGdSI/lOsdjqfBXTJ0pUp/ucOBVZ/U//EkN/EtUy/NTg+alNsENNYirfP
	edHe+wqg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vSbSV-00A57b-Bb; Mon, 08 Dec 2025 14:39:23 +0100
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1vSbST-00Aa0i-BI; Mon, 08 Dec 2025 14:39:23 +0100
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail with esmtp (Exim 4.96)
	(envelope-from <mfo@igalia.com>)
	id 1vSbSS-005AGl-2p;
	Mon, 08 Dec 2025 14:39:21 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 08 Dec 2025 10:39:21 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/9] mm/page_owner: add swap hooks
In-Reply-To: <202512080831.Fl7k0uXy-lkp@intel.com>
References: <20251205231721.104505-6-mfo@igalia.com>
 <202512080831.Fl7k0uXy-lkp@intel.com>
Message-ID: <677d240c3c8df21e9090c20a6638fdb5@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.2, Tests=ALL_TRUSTED=-3,BAYES_50=0.8
X-Spam-Score: -21
X-Spam-Bar: --

On 2025-12-07 21:58, kernel test robot wrote:
>>> mm/page_owner.c:593:7: warning: variable 'i' set but not used [-Wunused-but-set-variable]
>      593 |         long i = 0, nr_pages = folio_nr_pages(folio);
>          |              ^
>    1 warning generated.

Queued for v2.

-- 
Mauricio
