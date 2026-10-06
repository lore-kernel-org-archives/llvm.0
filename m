Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F513C1F22
	for <llvm@lists.linux.dev>; Tue,  6 Oct 2026 07:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273573; cv=pass; b=XDgx2/mZPhQR3zwcMWc68bwYG0B5Cn1CpRKlGfv1HQrWmmIT5Di8aceL/tpu4vVUlw5GTNw3ueWCPlK3swZ8pkKc495Jaq60aH01qgB2SP6GjX1OY4AzqoR0PR5eh2swYMf7eRXoMqwNaaeP5jS+SQ/z3l4WVy6Onr4WsJM7q/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273573; c=relaxed/simple;
	bh=ZU2cQMmasHr1yoJwdZJaMEya/Sh1a70VvSBGFfdNluk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6HK/T0CaiGcGrB8WVogNYKAS+j6iOemM8K8gs/bbcoTLWm54ufIyqyaNhAm0hZ/QFilGmRWfrcYd7a7qbOapmY+FqAY0PFQUeivYlzZ8qjrwoaovDYihnM031Xiaus6qoEJ+vtGgwiq7u0xZu5ZBabW+AHx34+f49V3gEPisAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8ZAnwLR; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8ZAnwLR"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8565d77c277so3720597b3.0
        for <llvm@lists.linux.dev>; Tue, 06 Oct 2026 00:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791273571; cv=none;
        d=google.com; s=arc-20260327;
        b=GGkvzSwAco8hHlQBdQriE0jHzxefZF0BBGupqzk2+TGR2EJLhLgAevTdqIomzCOMKY
         62AVFjJ5lMFYHM8glfjVMReds++/eUta8kCoPdbnZpTG3yub1F0/+87LzV5llBs7cUxT
         DY9bI9TblrbGSoZLiR8apMhaRXpbSuvL+ZQRz1gc5yNbOJpKkNc6OixW4XVXpyj6HcMt
         RwDFsi8gB1lpw0Ln/KjhHgAPiVo3skZ2lfmOADFxca7xvBB0benWZYueVP+CYECtpfnG
         KYwt5XjkzAmbdCoGq+xSGGJJPxbjnzCcKKWhH3/cdy04xAclcY0ckAA3bcIphbdKZ+LX
         yEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fRhb1dHMtjLWIFI+yLicxW3PUFK92vbcjg4NpaNjie8=;
        fh=xG/B4ALJpjzNbtz8rMT1QnsUygjMIyyglo1+Vpsr6JY=;
        b=UU9Nxtt1W4/nbgFc300YyoUIrTAvLgwOEeWeQ0rRqsi+r/HpzMeIWkpNiEahmejVHt
         o0/EBwSi7lYdP/Z1q3t+7Xzxq/eWHb66CVFW83G23ltpodzJMnRdPGCGtN34bA9RMro9
         wLMSqpUmVHrIxHeSXXIa520du7TuZuVRpqyREwPQJ3b4aoNXlDcoeX15xxL6NB1yJYB2
         4DtYgX2A1PltxnFr6bSNnJtA1ru+P35j8n79g426VzN82dZ4T4Uq945LXeT/LyWi+m7p
         1qE4pG9IFmEn6yonTIoVJjGMIVyCEWycbJ8N9c+2yAwvWDW/pEQtfTnZ8gzK3F8iKd11
         YPyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791273571; x=1791878371; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRhb1dHMtjLWIFI+yLicxW3PUFK92vbcjg4NpaNjie8=;
        b=N8ZAnwLRNrrS7z/ssXI+Os21N1FZUYjln7fZPW42/aL7gDWdJ9KbEdh99h0h2uGL7o
         ReRzdWtBbLcyuE4TDjR1tcgWdJHft/UDrompt7rwYgM07l72SjJ6Nz7xk6Tpm9e/M3g6
         NAvrkDCxPjxZEVT2wUUzGpi89KymrFie7F1HubHMxMh64QYx2A9mfko8TalSa9FEaPN/
         aVERvC+VbE9LHZYzapXjLRXLwNc9Ll2ls8o8PHtAzOrSlBorjbD/TSHqVQr+p+/eV/i4
         CoHbHCU4By70fV9Lf/sVuZRu7x4e61+HzQb9W2M/b6WV/cWTIM39AwfC9ePleUPmT7PE
         bDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273571; x=1791878371;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fRhb1dHMtjLWIFI+yLicxW3PUFK92vbcjg4NpaNjie8=;
        b=igdcN/mXoxPJbGIvuyU1Stz0/v9AY+P1PgF4sk5Kd5+niXyj/lws7RlVbXkI4p5FQH
         T0/1HYz5snuThAS4ZYR3AWOZ5ykxgNY8ktFHCkgRt5nEjt83/M5EvbSuyCFlOfn9RoIO
         WODXcHY29mM5Lxg8usI/i/lhfmK4ol5c2rILuW0GnbVECkEdtH2phslJy41xcWkA46QU
         BMGCfJ8mZBoMyzj8GxifdsPze0ChKfUIdgh4XxLldKSV6Wcf74xS9uIH/o2//I7WeiO5
         t3+KCrRHqLsALKh7IsrQHSWhEmAyvYa9yPUJsSfwQCxGNGgJOAC6ms9SxzIaQUnLIqvL
         ZAQA==
X-Forwarded-Encrypted: i=1; AKwUvBy//0Ntz7vQWEikansNzSDpeGOL7MdX4oYJOZMS2n9mmyHcDI3fNQHr3heMK58rLeKj5ktT@lists.linux.dev
X-Gm-Message-State: AFq9FYITLehd/YozHW4O7xrPX/cKaSER+I05H3c0LVi2gwGFqoLLv6dh
	womubranS9K06HLSbP1toxA6oNwAJI0B7AHXWMZCPW4PseEJVsjE09DUbfiw3YeVtbrzw0ynQ9G
	ZP9hYLA/hqaPscPd4mE3/sACaZ1c7Bww=
X-Gm-Gg: AYBFou3oV2APG+pTm9jVNo0sY6xSYz2DcD1ffLBiXJ7p8/xAYi8Yjr/xtm3cgm/V22D
	ChG3vhN1sUZeT39cLECvfaBJcf9nds7s5ie8oMIS3Xz215sCcmWGdydIkEMfKPGgQ8dHl+Z09zm
	hldqF/URxdDNmo0PQILOGF1QvW8dNRHruTxUUusDcXZzNUw46dOD7mA/GdMTHVijo0FyB6cNBnU
	1n8inOFdvUgTclXZmAbnYNP2BriP0PGLOEdwGTNrVLtPjyuvAhp05LFySq1vCbqAdKOSV3dRvUh
	bqK4ExuhXncAYiANQxUGDipY3mU/3+GbpTckXb7GEHn1rs3YvHd0KF1TMVBub0AuC6o9TOG3KxS
	lyd0SCwY4zHkld/lTi1mlrl9aCENTbLQIn+8gE5HPWwerq/L4mbPeIOlVaDhfRevce2szamL9cQ
	oSPkzSHh9yFfjDtUS8fidZPT4MO86Fe4oH9GZsDD944QdV+hn+q/Q=
X-Received: by 2002:a05:690e:1407:b0:677:b426:5072 with SMTP id
 956f58d0204a3-678fcd9a7f6mr260069d50.47.1791273570848; Tue, 06 Oct 2026
 00:59:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005203930.246598-1-rosenp@gmail.com>
In-Reply-To: <20261005203930.246598-1-rosenp@gmail.com>
From: Kjetil Oftedal <oftedal@gmail.com>
Date: Tue, 6 Oct 2026 09:59:19 +0200
X-Gm-Features: AclHuK8uZPRVB-V-7veiRIMf2yGygSpvVmN2QjDCYDa6UJqn_IrMh2dWc_mXHWU
Message-ID: <CALMQjD-udSokCKS07VFWauBQzac5BTPJqbORhskxgddsuX1vLw@mail.gmail.com>
Subject: Re: [PATCH] sparc64: Define p4d_page() instead of stubbing it to NULL
To: Rosen Penev <rosenp@gmail.com>
Cc: sparclinux@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Oct 2026 at 22:41, Rosen Penev <rosenp@gmail.com> wrote:
>
> A sparc64 allmodconfig build with LLVM fails in vmalloc_to_page():
>
>   mm/vmalloc.c: error: performing pointer arithmetic on a null pointer
>   has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
>
> sparc64 defines p4d_page() as NULL, on the assumption that it is only
> used by stubbed out hugetlb gup code. Generic code now uses it in
> vmalloc_to_page(), ptdump and KASAN. In vmalloc_to_page() the NULL is
> used in pointer arithmetic, which clang diagnoses even though the
> branch is unreachable on sparc64.
>

Has this been reported as a bug to the clang project?
As it throwing an error on a rather obviously unreachable branch.


Best regards,
Kjetil Oftedal
