Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89373D3487
	for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773441571; cv=pass; b=hlM5I6r8xTotBs19HXH/Gf6vaa0x6/cOoaKQrGfT4OL2AKjIUeOX7AxP4ppjrwUgn36YOQu1xcH53vG7D4ftE06HADuS8CTUiM/KvgqxrtT8CSTPKbwKqz3gwB9//11Q7+SzPfGOCR9kECxBecJIS278ieMnSzWs36kcV4yx4Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773441571; c=relaxed/simple;
	bh=1MXpnJgNd9wve0xok691+KsLsOIVO5aHkrdME7CbtZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Up9VeNYCqBe8CEZTABDAZWnsv9lGaQ8I1WtSh7qDE6jkw/F+z5qwjGTf8yYsU/xaEuCHgGAcdYYO+iO+EBPs+jd13J4+Kejt1V0PxRzGV2P7zJbpVhlkqLHdE0+FFPxeN+w98UMv532yU7RZCffipxd6onqKotmTW3x0j9pQXbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEWWe4PI; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEWWe4PI"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-128d600ad25so123311c88.2
        for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 15:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773441567; cv=none;
        d=google.com; s=arc-20240605;
        b=Q4PHX5fgVvcCv3Tlz1OTXZ3P0HrLILYv9WhSsFVoL6rPCegEhiEpqMA6yBRps2E4Lo
         ZY2dYh3zUc2rNxm1/wK+OTpqE69j9nVrBP3wWd3NTDV8Hmaco13M09Ne+yed2U4jxCaO
         IbKD0H9/T/cc5uxmae2hwnNW3ECuVPnMCw5XPJTxsbY3Yz0lAxtgmFXbF+OXDlF1SzZr
         SqVSsfhADmH+apG7EYlO980BKa0kyzI2Z2KloF5CNZyM61oWXgHOpzixlBdRbnU0jJJ+
         Rn2wwbJX1YkjePWM/kERylglDX+KXCx9En+qs1tZt0prChZtJ1Y/8wu7mUkrzlHKS9cd
         +E0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MXpnJgNd9wve0xok691+KsLsOIVO5aHkrdME7CbtZs=;
        fh=IqSJ6ZBiwPApKPTXDdAhKUg+ArAWkZFg6vILSGQUr9o=;
        b=OKe151C/dqH0nHo1IjVuItvODkBIB7202vKGgQLddHDmpfSiAWHr/7XKh7yL6QFdgd
         wMeyLoaH6RHJeQviXWvwrxCod3+L+YD6lOghub6DUozsV+jazJVj9OnUPAHUEs+3Zo7B
         hOzK2AA0+RCmyikoU1tYxMFG9ezgDL7sYoPrhOg13k/soMsmGHkDwDAs0/x86J5lzt2E
         eGgb0tN7BRXI4mZUbh9rFQ+jPRKyqCYxLRWE1KIw2EBefD4w0TM9rs9x5u8zby+3F6en
         hBUQ2ALw45mguVLfZp6PqyZGC2JoQx+D9vPNydvrwAqz0Ff+rkdHE/gFFNa7xJvUF0kj
         VD+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773441567; x=1774046367; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MXpnJgNd9wve0xok691+KsLsOIVO5aHkrdME7CbtZs=;
        b=ZEWWe4PIW2Ms/F/iUUc/uUJUgNiDs5ZBzZvwGr5pcTBsXir9W7BQW3vkwgPjuXFwuD
         rIifaszG1e/BEnvCPsAmeP2+tB1B2S8ng5wSA0qqT/qRTtQWnHWUCVyK0lwXaZtA72s/
         aSOytII++k42aoLiPnWrb8FJrdkKSOG6NArF/slNbU55ptmsoVke4938vwws9QtkkSd1
         yTIeiEyVyQV3dOCGHx+KXCbQOQmd4ZTLPJxn1TlcJSt7VdRGBfvsslr51EShniU8v2lg
         w8fzADtET690qE/V2EYGQXlmZhqqp+/obgMIMFRkj6G4aY+MNVur23eR2dh/X8U+S94j
         IerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773441567; x=1774046367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1MXpnJgNd9wve0xok691+KsLsOIVO5aHkrdME7CbtZs=;
        b=GuKv+pu2PwZlNXU7XOgpLoSqlK7eESTsKdtnDyf72RlZLNoNxhnkxAFyy8ouLQtZau
         L0YYtn0IvHYF0oVN+LdF+iE4plFgh82ysUQR+mJI851NVOhIfYDqHAzrffVCeyPlFUyx
         MEgTXHAW7a8A/gKFzsxFdUdWAYZZT27HVtm34jkK1uvk4czMwjJ17sbyek1e6ho9cjJA
         4sr+RinE+5/aTpbrRzziznO7O4p8FKtiCehLiNBfwcDEOX0tpHXebDoer/h/4Za4MAog
         OBwadUExO5yhkyJknFO+ENv1xisfXbIaTIeCZ5vTMhZZHdeQ2gR+cqURaMOcf/1oq3gJ
         HZbw==
X-Forwarded-Encrypted: i=1; AJvYcCWglA14yvzOZXXllGLL16P5IsC3CE2V8vT0BFUCCfCIZIYmfBR3lflonKySuO30OPZBUJ+O@lists.linux.dev
X-Gm-Message-State: AOJu0YwJwI2cIB/uuXGJMBCDLoP8lWq18atf/BOhmuVFCZ63HF+GwxlU
	DYQQlXCL93N03eCbPvAJQE2Z5V+THQz4opQLFG9Em9X0HAusNJyOPWny5wVsVC1nCbITncEUBd0
	I5mpitX0A/fBziR9ZJsZxnN596DBtGCw=
X-Gm-Gg: ATEYQzywPRrJzwd1Jov9lmCPcYZvwkuDRLkqD+LLS8l0ZXRSwR7TwnBkr0/c8qXHgmA
	7PeMPnGB+ZQubvbMSbEW86z8DF3rWFsxJ3Z8FrPjX2S7I9IXRG05uXokNi/wpnqAiAD6qtm4XVr
	iwoM9SAaqZ596tTg7gandUo0LNB/tRSC4H4DVEfHFCNET+SKBqrtkN3thNJFo6lSe6G2AMdeVbE
	ra01DY61e/PgLGo0E4eRa5SN4wGWH70obmRcgCRY4ck6psR1OvufBgzF20PdD3p3qcObWx2qiRq
	7rH05+Bjk7yMVhJQ2zFmdIaoZV9bO/fVE/F6VU87lSjcN1lOs++0l/O6ZNgdAWJkJohaWLGuazs
	SyJY7+m4kjpzvXzkIQ/UHpLY=
X-Received: by 2002:a05:7300:fb86:b0:2be:e92:7f44 with SMTP id
 5a478bee46e88-2bea572033amr1222141eec.8.1773441567469; Fri, 13 Mar 2026
 15:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603121235.tpnRxFKO-lkp@intel.com> <20260313213638.GA147391@ax162>
In-Reply-To: <20260313213638.GA147391@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Mar 2026 23:39:14 +0100
X-Gm-Features: AaiRm52mq6KFRynN2HWB61zFcs2DGJMHqt1i6x4Cnd5DvVDH6nH69snDO17l0xg
Message-ID: <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Mike Rapoport <rppt@kernel.org>, 
	kernel test robot <lkp@intel.com>, Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jann Horn <jannh@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> It looks like this is a conflict between Alice's "rust_binder: check owne=
rship
> before using vma" [1] (currently in char-misc-linus [2]) and Mike's
> "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unstable [4]),
> hence why it was bisected to the -next merge commit.

Thanks Nathan, yeah, adding a raw pointer (not function pointer) to
the struct makes the type `!Sync` in Rust.

I assume this is best handled with a patch on top of char-misc-linus.
Perhaps creating a wrapper to assert it is `Sync`, since the
`BINDER_VM_OPS` contents are unused (so far).

Cc'ing more folks related to the commit.

Cheers,
Miguel
