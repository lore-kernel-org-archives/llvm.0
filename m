Received: from hr2.samba.org (hr2.samba.org [144.76.82.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA19E19D8A7;
	Sat, 30 Aug 2025 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.82.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756558909; cv=none; b=ef7C1O6LIlN67uRj+bPx5ceoLOi+UZRzLwOVQ3KsCVtadw/zpZJnR6vMGTSYXvtMLv5iypYa4OKjiAqgUqcHuVLELa9jmFQVZI8LaQem1bewmZXmTsZO90r3XR/0uG40EKcjwWED5FJRs7gGadgPPciAHbzkF7tRbKtmHCrHkUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756558909; c=relaxed/simple;
	bh=1xN84HVnh5TKVt5zCoR4FPrED9BI3DwgO0JPtFWLZwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nf0vxPv91q7mCEi767TWHb0SRzP2EtZjFtOH9gSXujQbtP4hgmdYNWLuVV+x9opJiUv0UCQnLy4htRkTaSFVbbw1TQCHSpEdKfMWZh1++TP5ZJvStuD6nulJwq4CH2Q08rQcTgWxw5cSnofv4trhHpN1thAt6gIlVPylqtELBpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=samba.org; spf=pass smtp.mailfrom=samba.org; dkim=pass (3072-bit key) header.d=samba.org header.i=@samba.org header.b=HnPkC1En; arc=none smtp.client-ip=144.76.82.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=samba.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samba.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=samba.org header.i=@samba.org header.b="HnPkC1En"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org;
	s=42; h=From:Cc:To:Date:Message-ID;
	bh=w2r31b6ZTZZA1hM3FAitQ+11WoJRiWHiNo6ir0lqUzA=; b=HnPkC1EnBTCOFeXQmdM1hhfEjz
	sfgcLJsHV+N7VkeNXAamtlMVl2IptrEfifO9VfB7+NbKaqSzeCTaya6mUpcem5SDGSIXE4TL0CAt4
	kHxFad++mEPoWLOrWw5zuQb6Wtn1BRWpgK//EdHcKpoE/uFGlu1TubYJQZKaMLIyvJH/k0d5ax5DX
	AMViecKVJEOOX78kKJswdHOYI0qhZeHIXZ0p9f4gsd94JQKYoEQJr+PBIGjkeMsSS3Y2DpexL79G5
	uWAIhEnAhqKwhJygVjB9MOav9OHQamvbiC4SB1v6KOWrhwHii3F7G0F5VSDq2w4sJ8UIqF6ltgVRP
	eOQujMZVit7wUi3NqOYtm3ryZgKtSu2wfhHbZOM5kvLx6X5k4XL9StUJjUSwjYGXltItuEyAsZcqk
	D+fxZoeyjbj24Yw4/26Al87zgPsxsS4YZR5zoD99YZ/VtgJgu2D0GSLPWwmbFnyp/A0LY7i0ClCS2
	8GP02QdtkuMJ+7DFdp1SaCTW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
	by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
	(Exim)
	id 1usLD9-001acg-1v;
	Sat, 30 Aug 2025 13:01:39 +0000
Message-ID: <6197b8f3-7f44-42a8-a2f5-061888898865@samba.org>
Date: Sat, 30 Aug 2025 15:01:38 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cifs:for-next-next 28/146] fs/smb/client/smbdirect.c:1856:25:
 warning: stack frame size (1272) exceeds limit (1024) in
 'smbd_get_connection'
To: Steve French <smfrench@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Steve French <stfrench@microsoft.com>, kernel test robot <lkp@intel.com>,
 Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
References: <202508291432.M5gWPqJX-lkp@intel.com>
 <c18ba6b4-847e-4470-bd0e-9e5232add730@samba.org>
 <CAH2r5mvksbiH-D4FbVb0PVg1vnik+WU7d0kxRUk0S9h9S+=zvw@mail.gmail.com>
 <2854f742-a0bc-4456-a372-9fa2d4e2ee3f@samba.org>
 <CAH2r5muGufmSdjxqTv9wcpbZoMsoEq=1ufFo_Yty352uDf+3-w@mail.gmail.com>
Content-Language: en-US
From: Stefan Metzmacher <metze@samba.org>
In-Reply-To: <CAH2r5muGufmSdjxqTv9wcpbZoMsoEq=1ufFo_Yty352uDf+3-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 30.08.25 um 00:31 schrieb Steve French:
> updated " smb: smbdirect: introduce smbdirect_socket_init()" patch attached
> 
> Also updated cifs-2.6.git for-next-next

Thanks! Looks good now.

metze

