Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0741DDFE
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 09:08:48 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B8E5040E01A1;
	Thu, 10 Aug 2023 09:08:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3uPHsuwLfHm2; Thu, 10 Aug 2023 09:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1691658524; bh=cYKwZJwn8Zi3aaPjOMpbZPIpubxlBEkGEtU4H+uXorg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNI5yy3yzSzJxFig1ejH50H14RNsKSe4oJ9f1RZ7ZFF7G+4176nvEvyxbxqxpQ4cP
	 ZgB+T3fuV1+uLGvs/hzU9m4MNnfLzoTrNHvXoFdlC0UA0syoMw2gAAL4bjj1UxZObV
	 Y4K6aPE37JN1fNyJaAWCnrDjT2KdjE7sL93Z13IJ8/tIt9P6l15ZIEnkEXemQlFmfg
	 AMqATXo74cIbEMc+WfD/wGi2z7L3a7Q++kNhU8VZwgvBYoXL7lcQdfAIPz1TB8a+Rz
	 UGauz0FRog41rzPWnAkuNZ8Os/97tvoFKjNPwJJUzGCa6HmWauzi32bE6vljxQw8JR
	 +cpzfXIXaPoJ0N5Hz0Geb/u0WGmyXMDb+V3rL3zhduIS33v2wysTGZCBW/CCQPibAY
	 t6bdBBAP1/XaFWAZYM60vTQ7IbpPElfO1doB/fkuqWEqON30RmMbsY+EtFXHQ8Ajwd
	 xdWZMaS3HtbfmQd2CcUZn9OCaDRwTMfkJb26nZTdGfA7Ffs1shE3YeoDmgDies18eS
	 LUHHNNDjXLlw6OTVqQkiYCoCn4i+9PVGwnWUMiqGkzsVxtu6u6BOF/X+5xfHp84NPy
	 oa7/OEDUjoYQVX6DrB7o3WpaPjvLyOi8v+gO/ghI/PHZKmTqYXj19l7iuIOYCTxqtL
	 SxweZVeCV5Efxf4eMPGc1EmE=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 976E940E0140;
	Thu, 10 Aug 2023 09:08:40 +0000 (UTC)
Date: Thu, 10 Aug 2023 11:08:35 +0200
From: Borislav Petkov <bp@alien8.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: Hang when booting guest kernels compiled with clang after SRSO
 mitigations
Message-ID: <20230810090835.GBZNSpE6tCw+Ci+9yh@fat_crate.local>
References: <20230810013334.GA5354@dev-arch.thelio-3990X>
 <20230810081038.GAZNSbftb6DOgg/U7e@fat_crate.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230810081038.GAZNSbftb6DOgg/U7e@fat_crate.local>

On Thu, Aug 10, 2023 at 10:10:38AM +0200, Borislav Petkov wrote:
> I can repro this here with Debian clang version 14.0.6-2 even with -smp
> 2.
> 
> Lemme poke at this a bit.

Err, this stops booting even on plain -rc5 which doesn't have the SRSO
patches.

If so, then you'd need to bisect.


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
