Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43C3190063
	for <llvm@lists.linux.dev>; Tue,  3 Sep 2024 17:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385537; cv=none; b=a9w/xCk+2zHmg7BUwE6Zyf5bTX+75PT5E+GPgGyEvJ0bqSeADof4f1tkZxuR4nbGhNTALqcWEz3asooV7ct7QqagoMBowYIg/pYspnZXCIfqxwSPp5BKbFUM23xVq90W7EKSNwMANb1s+Ad3Zw+B9LEeP+DevPx3FRhrxoLTvy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385537; c=relaxed/simple;
	bh=0DofYcV1Ki+ENSwTIpZw+asSjmZojx2JbABHePOoO20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cp2ajpEKxKQ0VDf/CQKyiC+SfMQwFzhiSWMjKwi9vBb9ssQIICIiJLZVTQl5ZhBvYCSoG5uGxkO9J7lV9ndj+7sJ1vLheA130oRf4GujBiOMsfkLq2YCO5Iy+hStrQGKILqJBgnCr4Fss5goed148+qfp+8ROAHaRDiYQF18bHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhuLp5kr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhuLp5kr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d871bd95ffso387041a91.2
        for <llvm@lists.linux.dev>; Tue, 03 Sep 2024 10:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725385535; x=1725990335; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DofYcV1Ki+ENSwTIpZw+asSjmZojx2JbABHePOoO20=;
        b=YhuLp5krtZINsJzBu0JZW9CerWQQQU67wESHnBh4RmeStaR6riCJYvHd7B7ZAWtJob
         2tvYDRIPwkUJCRQJQ3hW2I/BJFjNnCEcCqKLouEWsRboIwHxZQSC6ybsoL7FvL3TSBOm
         PGolPB8y3H8JeMegDAtXZiPkBy65W/pwV3NlONJKwahMP+ZRJGGVDDBuLNqcCGO/pPmR
         X9pIv/UQgHuIlblsLgPhCp3tyzCLBFtS++uC1LRH8SqreBpElLPNoxd8sdDVbuEpioiJ
         yneExxubUo8uW1eEl5lr3LW46c96retRRGs5Jz4QwZkT9I2m3jhN0pga/QDtICPs6RIN
         XqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725385535; x=1725990335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DofYcV1Ki+ENSwTIpZw+asSjmZojx2JbABHePOoO20=;
        b=izACItoESCxd7n3OpQERpCqFGiJVEBTjOe3jQcGgJ+Zo6XCIlP1suehdxMOFekCpG1
         Wc+hHR7SegEuNYnwOIO2VyvrrqSZe0paVAxk64dCgOqWvGWm/jJbJb/g3HU92z/fZINm
         7ni1TTKFRkJI8mx44QHev0BCn4INOitpye/c7AaY2DiH9s33MwyBaSgOWSZC9msjwqqy
         owbU15Mg4NvwQ9/TPAkeeBPSAKgJ1c0a7ZZTIVn4EAR2556p6DwF6UjJUIWhGToTKNED
         zWdbpDXtzcIVDTbeaL6xeX0oCSTsuXf+lse+1Oadutzt33Be5MTTn5XhFdgASJCq2Vr7
         bjxg==
X-Forwarded-Encrypted: i=1; AJvYcCWmzLwcXt/62rql5Xw330yG3Irc/U5kDo9vHKZq72ukdWIglG7rIesn6t3lDUQA0KBwQOQv@lists.linux.dev
X-Gm-Message-State: AOJu0YyQF1K/GuYlt+s0zCWn7m3Vgd99dNxxa2JN3gh9venN23pX3dU7
	OKFmnqFpdejZZVVEkz1yvnL+GxJx4tXrOEYHRGrthLqdSSGz39rOeU4HBJxC2/LW01fRLlMda9S
	ZBYndi4Ivq1NLbF9anxT/xdZqXwo=
X-Google-Smtp-Source: AGHT+IGSJaGwOM9WSS6C4CfJ5n+iQPEV9+ern3LlVZwrkMxCoO8ICwpxdMLXqIAiQmi7uSiY7KxVOTk+pY+MMkXUU6k=
X-Received: by 2002:a17:90b:207:b0:2d8:792e:9b22 with SMTP id
 98e67ed59e1d1-2d8792e9cc0mr7985254a91.0.1725385535089; Tue, 03 Sep 2024
 10:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
In-Reply-To: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Sep 2024 19:45:22 +0200
Message-ID: <CANiq72nG-7Zbd11S=VkMdhpSON8vJOpDe4qhGy3czrKgrJ0DXA@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: Initial MIPS support
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 7:14=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> This series added MIPS arch support to rust for linux,
> hopefully MIPS is not too late to the party :-)

Definitely not late :)

> Sample rust module tested on R4000(el),mips32,mips32r2el,mips64,
> mips64r2el,mips64r6el.

That is great, thanks for this!

Cheers,
Miguel
