Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956821FBE8C
	for <llvm@lists.linux.dev>; Wed, 23 Jul 2025 20:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753302735; cv=none; b=i/ZkfmYdfZ2ezdq6gFB+xIqhEZLtgjSS0XGKwJTjujCbof3DbQw0Ybx0P2WFI0s8nZpSz/+CpEbbQUBa/4puh60IaIfvUAlMzHuD0URFBlH04Pvh9k49L5pwE7B7/EYTq64JmTDI8dWRidbzdSwY68VX7EMiTgno9oPVNNvqRNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753302735; c=relaxed/simple;
	bh=GTXQscJU4LPgrl6bU/T+prkMwqEg/02bZaCUdUkEXXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQsL7bB6/pYup2sn4MOk8pj4nxJSZILOugxUqu4ID3ipH2fJhd26e4TSjTYYzE5RUUuoFbRw4UERKftwrUad0t7dFl5rVsNYFHFSU7H5EDKXbiWmf9sWBw6SQAVEfS462evy4h3F78cbnIlhVQzoEKjBJbVg9++MhBU5XqJcuxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fOUolFzi; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fOUolFzi"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so549244a12.2
        for <llvm@lists.linux.dev>; Wed, 23 Jul 2025 13:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753302732; x=1753907532; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7tW3QBWuerrQdiuDXr9GW4Ls+mtrfwnWITMUravp8ZU=;
        b=fOUolFzi2jjwYkN3XTbiSHhuB60vWjX8wlh23bokRdQ1XEYVyllLShGxEUES0AJY3d
         F9/YhPQp1D5BAWQn5ytiSF70EvsDxpdLz0wmoMSVZGbRrDxDjtnzTLsrh97wp4Ov25/q
         JCFkkgnWlHK9c+9VatQ+fZwtsTutl8nz9w69w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753302732; x=1753907532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tW3QBWuerrQdiuDXr9GW4Ls+mtrfwnWITMUravp8ZU=;
        b=bK27xqFToVoUPpX+smLtlQ+dFJR/KSiPkP6CgdzD8weuDme6fTjCAmmiHnDFdEaTxd
         HWGuOnzw3tQEunfF2edc7FpPtmD/2f76opzbPniiS5/XhOzee5Pifdqe4LIPGnqP5Gc3
         PE2963xCnT4I7zSdg3B/AqnkK8Ee4X7gIZlSJcJu9SRTZuT55gUtaXSq88/RIOOPC+B4
         O6yZ06Ie5SXTOwbdHorlge26o++6E37CypTBidNDDF8Bbwuu8UwGMYuGSwQJ9IS/9kA7
         RQsl5eFa8I3Mu7TY9R3z05PWUHHm63gbK1dofj2uJ50eLcFzp1rQn4gUz2UUEQ8IKA/8
         AAPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUArZuILkrprqtiggwq5eGZJpXtFblTNj+lJkJktfkyN42QSkb+2ftYkwwXxlolGP71M/1y@lists.linux.dev
X-Gm-Message-State: AOJu0YyKBdcYQeI3vWW5kg8X5l3ErZrZQktikqk958fJQefGTfmw7nh8
	0dQE/5FtYwSayhlxu4BpFmgIADxAjXNTlmI4ueGUjxHT50KCwfLGS6CvEGIcf5PngUp0iLQC+3Z
	LyMedfXw=
X-Gm-Gg: ASbGncsFX5BUP/AokMGeULoSoxlaTopGTC2bq1Sbt2NHqxu+CNmO16/gfTsq4h8ilbM
	ITWo84WnlL3HNSt7joXoZFZ6PoN/C4XFHK6GxCBznO7pv5D151LahPtl20EUNVA3JZfNcDRyVwO
	Bfn/VYgpa6hJKy/oWj6oGDWWMUAK4lStOJrZKqOLvfybbpam0/p6pkoAwAyjb7S08fxpWddZ7De
	FL5mqenZbEfqo1ZfleLukljFh1fWQS4HdUwBeXjWOdzi8XUj1ORc+JePisU0VrIuGQZPiu2jKRM
	NEP53IU6C8m8SF2d9zaSA7ZzWh9Raw6Bki8AECGLCwoWXeLvBbJcUz5rO9H30YmfcJ8e4+k5sXe
	27kZK6gvzXWN1FWGMeiIZ9sAu5MxkvADxzDOQ0awuVZebcBHzvcBfsMqYM+7JmvDLUwGDKrRV
X-Google-Smtp-Source: AGHT+IHj8hcQszCdjDpuWAAwxwv/m+bBmnikQy/dvdJEbG34E0FJS1912OUxnxM+s0bqzy+hP3UFjQ==
X-Received: by 2002:a05:6402:5249:b0:607:16b1:7489 with SMTP id 4fb4d7f45d1cf-6149b58d94bmr3922462a12.20.1753302731641;
        Wed, 23 Jul 2025 13:32:11 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c903fd62sm8990174a12.41.2025.07.23.13.32.09
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 13:32:09 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so474864a12.0
        for <llvm@lists.linux.dev>; Wed, 23 Jul 2025 13:32:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwLj6vJLCwVpNZmp6w3cHJ0YFEGmMg0vI+bpd/1lJYfb4iQ/2/0EcpYp4DCOqbpDOmbxeT@lists.linux.dev
X-Received: by 2002:a05:6402:2682:b0:60c:4667:b29e with SMTP id
 4fb4d7f45d1cf-6149b5ada7fmr3885377a12.31.1753302729207; Wed, 23 Jul 2025
 13:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250723194141.617125835@kernel.org> <20250723194211.768813368@kernel.org>
In-Reply-To: <20250723194211.768813368@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Jul 2025 13:31:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgbAruRX=xFVGevggtRpHNYyMVwgNYYJgYg5hMuU6ASGQ@mail.gmail.com>
X-Gm-Features: Ac12FXwxyPrv8gGTCI226Aa0lB-U1g53Om9xi3Ol5z0sTqQ_za5i5iEvuIY4KFk
Message-ID: <CAHk-=wgbAruRX=xFVGevggtRpHNYyMVwgNYYJgYg5hMuU6ASGQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] tracing: sorttable: Add a tracepoint verification
 check at build time
To: Steven Rostedt <rostedt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Jul 2025 at 12:42, Steven Rostedt <rostedt@kernel.org> wrote:
>
>  kernel/trace/Kconfig              |  19 +++

Annoying "one step forward, two steps back" change.

You literally sent a "remove one pointless Kconfig option" patch
within ten minutes of sending out this "add two pointless Kconfig
options" patch.

Because as long as it's a build-time thing, please just fix the
problems it points out, and it should have no real cost to being
enabled.

We don't want to ask people questions that don't matter.

Of course, because you *used* to check this at run-time, you put the
new "__tracepoint_check" table in a section that is actually loaded
into memory, and it appears to be still there.

Just put it in the discard section, the same way we have (for example)
the export_symbols table that we also check at build-time without
actually ever making it part of the kernel.

                 Linus
