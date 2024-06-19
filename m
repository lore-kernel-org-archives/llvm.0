Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0A054FAD
	for <llvm@lists.linux.dev>; Wed, 19 Jun 2024 19:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718826957; cv=none; b=RPu08FZoOVlBVbWd830YIy3gu3nxoyQrrVmYGBvFMW/i/hnQIjMRR4BHkjphzSjlbAOyoBOjsLQZ9QUxM8T1bAwuuiuxoVSBwlUraCOMeb6dig73HUn04FZXpvjLBiY3bfRleezposxUQ39jkptL9IY9wItAORrLxT626PxcoE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718826957; c=relaxed/simple;
	bh=Ih3HoKeM+JivQUDjkQOQSsTb5IqA8OMRYT3a/x38Moo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ag72FB4+IPi8yhvnqqzJMEmhB6q9fqosCGM2AVWj5cFbN7rynQWOJ3xZdvvtX3V1HQjumxRajNWcvE/zRxxTF29RZEIaBurRMraXLO86cFcloKPQWY3Z1ql6hFXveVZiVQnLo3mpECSNZIjmfLAVMSNbv6IztQkawUF4t2y8O4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=p9CSOebo; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="p9CSOebo"
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTPS
	id K0xks8aROrtmgK1PJsfBIV; Wed, 19 Jun 2024 19:55:49 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id K1PIsWREmd4oeK1PIsErEm; Wed, 19 Jun 2024 19:55:48 +0000
X-Authority-Analysis: v=2.4 cv=aYKqngot c=1 sm=1 tr=0 ts=667337c4
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=frY+GlAHrI6frpeK1MvySw==:17
 a=IkcTkHD0fZMA:10 a=T1WGqf2p2xoA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=H_ziCM4yXGDOzRzd5GwA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3MFAG9hxEjQwa+Na4espi9g8ae3vk8uExQTWwRlZqnQ=; b=p9CSOeboBafi7eCrr10QNnYEXc
	Q6NqxD/i9F0BtG5dZYvyKu76/i/e5IhgIq5jRzPV66krblfk0/b3DpvpZBQIdJkUE2Pfr3h8XYBaL
	uR6+gPMErJMZ8evBgXbRuLNUYhtG1gIoRHB/6JdL8+guy92sR/d/TrqQkgtsISvA6JhWb20Bd93q+
	9oNzscGrmUs02R/4vro+OZyCjWWUvctfgu0kSJwmsLMzbGfQnVY9MuhKQAqaUF+Z41HSt3Hx2YS5S
	Ll6hG8O971aN8VPK7TgYONCE35fCgEj9767yQCEsfqdDGoh0Ih9RrkQuaxgnBBqoMBjP1kTUDCA5b
	rAdcY4og==;
Received: from [201.172.173.139] (port=50738 helo=[192.168.15.14])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1sK1PF-000xWO-3D;
	Wed, 19 Jun 2024 14:55:46 -0500
Message-ID: <d3c2ac49-b8c3-4add-98ad-d06924b33d65@embeddedor.com>
Date: Wed, 19 Jun 2024 13:55:43 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] USB: serial: garmin_gps: use struct_size to
 allocate pkt
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev
References: <20240619-garmin_gps_counted_by-v2-0-f82f10ebbf28@gmail.com>
 <20240619-garmin_gps_counted_by-v2-2-f82f10ebbf28@gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240619-garmin_gps_counted_by-v2-2-f82f10ebbf28@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.173.139
X-Source-L: No
X-Exim-ID: 1sK1PF-000xWO-3D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.14]) [201.172.173.139]:50738
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGvARr/Sqm1Vixev8fuGXPNGjTCY96S2OUzjqYY8jGYi3IyQ2UioUepmxS28aicXmhk3UZP4kUIo+u8xHj97Nk6LMWXY7rdrHrUgwigA6aZ2Y6mVAaAT
 bIy0YPgn/eaypB41zdV2U1X9wmVELfw1apDEsAL8hXfL6TCmfvyEdXh4RVO/FWZ0P6AijZPSY+JanDSM19R1err+iYnCV34d1pc=



On 19/06/24 21:42, Javier Carrasco wrote:
> Use the struct_size macro to calculate the size of the pkt, which
> includes a trailing flexible array.
> 
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/usb/serial/garmin_gps.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
> index 57df6ad183ff..6d6ec7eed87c 100644
> --- a/drivers/usb/serial/garmin_gps.c
> +++ b/drivers/usb/serial/garmin_gps.c
> @@ -267,8 +267,7 @@ static int pkt_add(struct garmin_data *garmin_data_p,
>   
>   	/* process only packets containing data ... */
>   	if (data_length) {
> -		pkt = kmalloc(sizeof(struct garmin_packet)+data_length,
> -								GFP_ATOMIC);
> +		pkt = kmalloc(struct_size(pkt, data, data_length), GFP_ATOMIC);
>   		if (!pkt)
>   			return 0;
>   
> 
