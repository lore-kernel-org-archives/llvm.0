Received: from e2i411.smtp2go.com (e2i411.smtp2go.com [103.2.141.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F64194085
	for <llvm@lists.linux.dev>; Wed, 10 Jul 2024 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720620850; cv=none; b=DMBqplfdGTBvHd65Z6pwzB1TetqoMYNUpLfzJEfD72Vpq2Sc8HTOIPWiGhc9nWNm0uC7I1p2aojbmpd8H4/t3s105aWnPjCVurbRoLb4cKttIiLzE6zHkpKemgEUaV8NGNnT0L+HXT0h1dC/+bddPt/++BzE35YSDneEhtJ7s20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720620850; c=relaxed/simple;
	bh=ylJvQe6yXouhmyqUSCrQeKd2FVJi8wNyp4Lk/QcsRHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yoc/Tb7gVy+hvAFzWZHpenyCEtunF7OrR/BasWcAqM37P1pn5liZU36UD5k6sER/Sx+aOT9gBxd3nkNSlHuXbmP2YcVE7jzr4Tfjg0O+v2L4WV8fs8IS3z5EzqCmVnp48mLoVsOfIzlc6NLJWt4gs2HWtOKzMCajaAM8/DOP4Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=iULbpnlB reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=ImhpBfnT; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=bPkwb7ts; arc=none smtp.client-ip=103.2.141.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="iULbpnlB";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="ImhpBfnT";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="bPkwb7ts"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1720621740; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=B95DLpOylAGhXz+VZW5A2sqA7NLZQCORkGzGzk+hZlI=; b=iULbpnlBw9KM6CMSZSYYHFejcM
	q/QSdrU9Uur9Z1KhxMlQlPLq1RnR2oiasQBEw2vadoOxgVq+KUVB1cHuef1GCgkIw5wrxUzto99kA
	F587jBF0iVKGlTyzs3wFZS7cjVolnfrDw8C3e3sCTkj4I/L62td5f8TO28/Tr3cFR48faGrhyreX/
	kfd/qsvbdCIHC4610rQkiylCwRXC8/+OQTbiDeMmnjxsJTXKopOMBLrMd/ROHiZJk61ktoP51EJZ4
	fKKWxqr9Gz049DZtsgmWVyx0wj6BsF1Ai7LW0aqRguswc1jTi9SlQTBXDAhy2OS88lx7WsgiKFgbr
	IyTuA9JA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1720620840; h=from : subject :
 to : message-id : date;
 bh=B95DLpOylAGhXz+VZW5A2sqA7NLZQCORkGzGzk+hZlI=;
 b=ImhpBfnTfFoKN5Vi8tvXQFONZchHoM4IzbsrEgpXzSArG1dT2TO+83qwMs5g20TA8KqC7
 giFx+i7Mlzx9mI5YqV1aGJttY+yG1pDVtdV68Gy9LMN9QhRJAVbKm9vLY8S8JUJo7iuSjAZ
 s7lbwR9mvET9qlhMOTKJTVz0yjOaLcERnjT25sY++lS79OUZAO3AcBQiRPSSJGh9OzR9IBZ
 kgnNcCb/t9V1m4872ykgCAa2gHDrIA419qP4I/5FHi12PGUsr2nq+cyTlYIwR2h8waRGbma
 fX9NusFGM4FDpOIQnyb40CCF1VrqAk1SRWPT30olBQFtgZHJtMHKSwU4r8tA==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sRY4W-TRk40I-G0; Wed, 10 Jul 2024 14:13:29 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sRY4V-4o5NDgrfRah-kvCR; Wed, 10 Jul 2024 14:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1720620805; bh=ylJvQe6yXouhmyqUSCrQeKd2FVJi8wNyp4Lk/QcsRHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bPkwb7tsmdh0wR6PQbfXsJZHLuzG/mpHDAf+JosnWnckle4q8Y5E5s4lvNoJIKaXX
 7Sldr6FqT6x64ZpPU7uwJLXGe6wu7xU4Ch3JZj5GK2Nsps7mzAjlOBMQIwc4ODc5RO
 QhM1aQyC3dHd1lKHh/s/NQvACT+/lMLrxqK6Q/88=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 328623E8DB; Wed, 10 Jul 2024 16:13:24 +0200 (CEST)
Date: Wed, 10 Jul 2024 16:13:23 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Fangrui Song <maskray@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v2] kbuild: Make ld-version.sh more robust against
 version string changes
Message-ID: <Zo6XAwaC3PJQwVG4@fjasle.eu>
References: <20240707-update-ld-version-for-new-lld-ver-str-v2-1-8f24421198c0@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240707-update-ld-version-for-new-lld-ver-str-v2-1-8f24421198c0@kernel.org>
X-Smtpcorp-Track: PW0MKTEj_wOW.5De9TQ8hhW2s.Mi3ArgY_vEQ
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286s9eurscF3g
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Sun, Jul 07, 2024 at 10:06:47PM -0700 Nathan Chancellor wrote:
> After [1] in upstream LLVM, ld.lld's version output became slightly
> different when the cmake configuration option LLVM_APPEND_VC_REV is
> disabled.
> 
> Before:
> 
>   Debian LLD 19.0.0 (compatible with GNU linkers)
> 
> After:
> 
>   Debian LLD 19.0.0, compatible with GNU linkers
> 
> This results in ld-version.sh failing with
> 
>   scripts/ld-version.sh: 18: arithmetic expression: expecting EOF: "10000 * 19 + 100 * 0 + 0,"
> 
> because the trailing comma is included in the patch level part of the
> expression. While [1] has been partially reverted in [2] to avoid this
> breakage (as it impacts the configuration stage and it is present in all
> LTS branches), it would be good to make ld-version.sh more robust
> against such miniscule changes like this one.
> 
> Use POSIX shell parameter expansion [3] to remove the largest suffix
> after just numbers and periods, replacing of the current removal of
> everything after a hyphen. ld-version.sh continues to work for a number
> of distributions (Arch Linux, Debian, and Fedora) and the kernel.org
> toolchains and no longer errors on a version of ld.lld with [1].
> 
> Fixes: 02aff8592204 ("kbuild: check the minimum linker version in Kconfig")
> Link: https://github.com/llvm/llvm-project/commit/0f9fbbb63cfcd2069441aa2ebef622c9716f8dbb [1]
> Link: https://github.com/llvm/llvm-project/commit/649cdfc4b6781a350dfc87d9b2a4b5a4c3395909 [2]
> Link: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html [3]
> Suggested-by: Fangrui Song <maskray@google.com>
> Reviewed-by: Fangrui Song <maskray@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Move to a pattern matching notation with remove largest suffix to
>   remove everything after just numbers and periods.
> - The LLVM change that prompted this has been partially reverted to
>   avoid this problem, so reword commit message to reflect this is being
>   done defensively. As such, remove 'Cc: stable@vger.kernel.org'. If it
>   is needed there at some point, it can just be manually backported (or
>   it will just get AUTOSEL'd).
> - Add tags for Fangrui's suggestion and review on v1.
> - Link to v1: https://lore.kernel.org/r/20240704-update-ld-version-for-new-lld-ver-str-v1-1-91bccc020a93@kernel.org
> ---
>  scripts/ld-version.sh | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index a78b804b680c..b9513d224476 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -57,9 +57,11 @@ else
>  	fi
>  fi
>  
> -# Some distributions append a package release number, as in 2.34-4.fc32
> -# Trim the hyphen and any characters that follow.
> -version=${version%-*}
> +# There may be something after the version, such as a distribution's package
> +# release number (like Fedora's "2.34-4.fc32") or punctuation (like LLD briefly
> +# added before the "compatible with GNU linkers" string), so remove everything
> +# after just numbers and periods.
> +version=${version%%[!0-9.]*}
>  
>  cversion=$(get_canonical_version $version)
>  min_cversion=$(get_canonical_version $min_version)
> 
> ---

thanks!

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
