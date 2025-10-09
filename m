Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E9D1F7580
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 18:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760033657; cv=none; b=m3zGcA2C2FgVRUECqD26v4pYdftuj/1ksRVpcyHaVdfSl2Q6ASbDn9ppGN93mBICKb242zSFM9rw0zadblHro6ro4DSaKX6U9lZCHhO/Ss8GAHaT0w2o6PwCzN0QeY3rLEOitI0FmXhMk9yav1O6QmrQFRCNVFpWMnLTEGEuTGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760033657; c=relaxed/simple;
	bh=Se0ggIlBcEjUSR5vPSSxwDuywotTlhvRBXIE0uhueKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsQBpQrKPlZHxbMrz+/qQJBuKU+c716FEPn/heNJJfpjQ9f/yF/YU3g12det+GPBCRGH01h4plZ6pNBFC4a0srEkWFjgMrKTeJnKWv0p09cx950QudRK05cAnnUX04Y6jIzvtDrA6bBX4L8xKwJ5F8Rf+tig0AuTQSTjo3f6NWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Brb9Ux7t; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Brb9Ux7t"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b552e730f4aso38192a12.2
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 11:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760033654; x=1760638454; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Se0ggIlBcEjUSR5vPSSxwDuywotTlhvRBXIE0uhueKk=;
        b=Brb9Ux7tU8FkODqRB0yE95P5AulMf90PvEEozdbQnIjRB1tAKDqkxt/0YvcA1hU2LZ
         F80a/1rJocLxqZpz90rgc+QIMUYGvxqzluCpUEOI6oEvLNgWbR+u/zErDcGCNokDmUbt
         NKX9/DACjnlOqOfAxCfzjpYSlTnkNavnPb4GbU3anCe457bhSHitYqzAlhQU8np+T1+P
         ECeMhr97ikQM4ksLCdbGJvdF0hSg0I+HUpa7U+OUgJcqWePssGh0nWJ97aFRtfXttrnc
         VUB37OHS79aVmlMOccLLqnlfVKPJlctVuUpdtJBDnYeuXv3bpeppxuIz13RIDAq+hMjn
         uUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760033654; x=1760638454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Se0ggIlBcEjUSR5vPSSxwDuywotTlhvRBXIE0uhueKk=;
        b=S9F5AeS34bIQohvmcfzZTqE6k0dT3gj3T4oeM5etF7vYhUsdHQutpL1bCPYEKFnFSg
         oJ26abRDvaGHFcgo1pukY/CC4D8GlmXGasqqpibB7Qb4EjoEH+5t+vhzX3Wv7iqwN/h3
         nlvBxYyUVHEGEhcwFdQxGzAMPlMQWaNGwgT4y/ry+cNm918ALoBIB5wdit3PJKDeDd43
         HfGzvxHZ7Wr3q08KE/x9knmMjt/jhFgTpy8rg5u+GA0hxb8hWh/XO81Wx3rk6m7nsJZG
         tkBV8WcA+HxfGLm5SBtAf9MQLsnKLbPq+dIEoB65PVw5pknZuOYcCaOajbwooldyCwtE
         GKkw==
X-Forwarded-Encrypted: i=1; AJvYcCUXGxpXbgdgOVFuUhsfQHVcQxlP1DM24nNACdVCi13D7cgh1e+7LshM2RAC0g0Fk926AV5D@lists.linux.dev
X-Gm-Message-State: AOJu0YzC+cf8MGh+d/BMNYCnRnB1x3OZcpkCw08WFZqsIcsvGyUynHLj
	X6PekVhSln4twSM4OGcX65ubLmBOg3vJ3iWEy/xbnhKFXbjlcM+gm+i6sxRF9MF8Z3bCybvjjRc
	zxyaNfuJn+mBkKXMPqDgGJBf2XttZKEQ=
X-Gm-Gg: ASbGncsrvmSNOf1nW3daS4zEZLUUtfFHpEJK76Drwf+szwXQaUvdxfbcBaw86iGOQl4
	YYGWkIDdHppRULEIKH6ZffBr/aW8ePax9vVR+x3AU2LD8Sj+2/MjNKwEv14eOE4G5cY/JJHpSSk
	vPbJKnwi4FjMOqEDKVjIXhw3JWBiuFV/DTj1QzeD+Yqx7d0XMe1SoygdvxEAHKLCrtJEh6RWvee
	1mkNMB1/Z5SIoiiY3Jj9+MhMGOw2TZyrvkdEWqzEnj7dogpQEBoxNae4WdKzWXNPT03PZxU9Hkz
	Q+Fu19cyoRzUUOKbyUbgijZx3jCIYvCDsaNHX10yU/sIqtAxxg==
X-Google-Smtp-Source: AGHT+IGGPYXRNsSxfchYlEX7hmMR6KUS05w+/U5AckCkquWjVaqc6cm6OPP4NlzecvU0kbAiqldhBLf3tX6fgvs0CJk=
X-Received: by 2002:a17:903:18c:b0:27a:186f:53ec with SMTP id
 d9443c01a7336-290273040acmr66870915ad.9.1760033653987; Thu, 09 Oct 2025
 11:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510100127.yuqhg8uo-lkp@intel.com> <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
In-Reply-To: <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Oct 2025 20:14:01 +0200
X-Gm-Features: AS18NWAfpscSsC1ClYA_YRgf8xWotiQcbCSD3SzI9XzV_-V8UQWJVV7bXNBwDfs
Message-ID: <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value `VM_READ`
 in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 8:05=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> Alice, Miguel, please remind what to do about this?

We can either define helper constants in
`rust/bindings/bindings_helper.h` for the ones that the Rust side is
already using (like last time) or use `enum`s on the C header.

If you have it in a branch, I can prepare a quick diff for you to fold.

Cheers,
Miguel
