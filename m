Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBB333F8B1
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 23:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788478421; cv=none; b=DHyBNfjc7DKsJxuoQfx6ZFyC8A3bwWZ23qM3LRl2tTEopTpz1c6ktUJgvTsSJPcAr8mHmkCRX4yXlxFuQwXLqHKHhZ7oUhGxtPmwEO7yWISXBr0Tch6HiNgExgdFe+T+Epg89YWDlCsppGp+h1rJs1e/rbs/keKRs7+0Qst5y3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788478421; c=relaxed/simple;
	bh=/qWtFqHBkrtLXXAD1XpvUaW1zHKMs9ArEGyHDtyLBkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cs0gZApbQwipTZWdPIViOVlYUCUbmNXriPX5dgSK/pvB3mhW4a8xG1Dnwz+XZpEgswmRtAwO8ThFw8Hn9tA40QCxLvmUVQVt4I159IjWWlvNuJgNUX7KzI94etSZ7a4c31Ier7GHzvNbpAzQBsUHdk+M6ZB5alPQp8xfIWMGtwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FnO8MgWY; arc=none smtp.client-ip=209.85.219.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FnO8MgWY"
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-90d7fa95a58so4581366d6.1
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 16:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788478419; x=1789083219;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=;
        b=QGq3fyiejBSqGxH1J5kuFbGzarf7fep9cO7FfyLV8oTJqEYWjGNkZHPt2yCRXNR7jp
         qmuZYBfr83OOECxoQGDkgPpWVwBLq8kK5aqvAs63o/HU8jfE95dg7QrobzTcxv1dZDHh
         yXJpiJdBWgR527ruVWBpzMEqoAvOwsowTRtWhRyP0iSnN21aWn0TQglGyMd1XQ0iEc69
         R3FUXYHx4TaSOLKY2h9n1wVdwdy83zI9dpkJlhFh1+eleOBFhdwUf+Vd6x1edj49eNhc
         aw8TcseW41YpQe9owoFjVRfJ6P3IcQe6c1o4EbUzJaeiJS1MtuEWr1wUJ94hUvkhBcA7
         aMTA==
X-Forwarded-Encrypted: i=1; AKwUvBwwofb045ujn28KcB75SU3DKhTkJioRBEem2J7GIal2kIZ1Mft954Wj2Lsn3pKjOQDBerN1@lists.linux.dev
X-Gm-Message-State: AFuF++nJmCqgFGBAtFy6uY9Ma675z3fUY4jcqvCRFlMPPDg/7GIG2XHV
	zScdSoI8oBn9cTyD8BY6iqdCrdoFWOYNLsX6K9CuYG55s6j1I7oAczKXZPV6j+YKR3qLJUu8HLp
	GOuPvZem8nAeitsy4gykw9OGxj3tzwyjIuySflhhk/FVEOkAzUlSyh2LxDwf+2I6FbRDJkJbbnN
	7aLwCWJnVUw8E/x/alrpLwybFRkgrzrQRd8AJjCnNu9ZrSqCv+3Fot5eeKsKJsHdhmdCZCOpg2G
	1BnQ3aknay+kQ==
X-Gm-Gg: AYBFou1J3CFNLlRSDhtOieMcelQyTpMQjrwnhp9hk4KqvHn+yfToyx6my7Nl3z8IRhd
	UUhvZhWdgE2FRT70q3YNS/ed8+Y9qrIvVp0TNL7KKPcDHxc2Ez6HtqT3X5jE9MM1OWmdQpZt2+7
	bqXsUo5jLnViip9WCVpgmDQw08TIwq+q6W1e9pdh72+sVY2NgSK0+c5d8a0PjUs4fA7zklbR3RB
	RpAg5vy6qc5K9JKs/JqmBnE/p3tAPkwOSS6bKe3G+f8iGlHeoNdYheC1C0frQrkcZ2NRMB/njsM
	ThTMGmkhdd4u0g58igemZToaLYG6zi0G5gXmisuN0y01rAEQt6IA7bNCBbMIN9PERdcnQzZ8P65
	8Ap+zrmz8YkDnbS7qQp1X/pGHO7BjHgn9rdPwnxLeaWebWVEgKyqZEJf+YxSJsnTeB74jkWxJci
	+nHymsv7/Xlw0RDTa1a39flvDfXyrN08x6Gghi+ixX
X-Received: by 2002:a05:6214:4610:b0:90e:7fdb:8583 with SMTP id 6a1803df08f44-9103efb2f17mr37582026d6.8.1788478418890;
        Thu, 03 Sep 2026 16:33:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91040768000sm188996d6.27.2026.09.03.16.33.38
        for <llvm@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 16:33:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6df0a1e18so6749735ad.1
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 16:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788478418; x=1789083218; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=;
        b=FnO8MgWYFFtRfa3LNy0dXu4c0afPuknQZYfQhTk6DJZIm/CcUMI/CRR0wVDaRi+Asr
         iYsvHkNlf6c42lXarXRxgOr+Ca8kWgkg3kWzgtXYA+WZFxkgVPIT4kypi2HsG7YuLd5W
         /sPa9332Ky6pbIrmgre8ITWk6pNU6lJTKN/bs=
X-Forwarded-Encrypted: i=1; AKwUvBw3EycgsA+X8/j11o8kBbCZge7IQiJP0S1SOgy//gsGgkfpDPtZWsI2SE0iru+s+zRvt5ga@lists.linux.dev
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr3210966a91.16.1788478417614;
        Thu, 03 Sep 2026 16:33:37 -0700 (PDT)
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr3210904a91.16.1788478417146;
        Thu, 03 Sep 2026 16:33:37 -0700 (PDT)
Received: from [10.211.247.235] ([192.19.50.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm2238141eec.2.2026.09.03.16.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 16:33:36 -0700 (PDT)
Message-ID: <b858b84b-a1ef-45b4-a7c1-35ba28490e35@broadcom.com>
Date: Thu, 3 Sep 2026 16:33:42 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/vmware: Fix i386 high-bandwidth hypercall
 arguments
To: Zack Rusin <zack.rusin@broadcom.com>, Borislav Petkov <bp@alien8.de>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, virtualization@lists.linux.dev,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
References: <4ab10678a8f50053934b62b56af81f881c1d3798.1788414669.git.zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <4ab10678a8f50053934b62b56af81f881c1d3798.1788414669.git.zack.rusin@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

LGTM!

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
