Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F0659151
	for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 09:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706606095; cv=none; b=uDOPSE8btRM0hqS1Cl3LTpYEPYe6WDjs3Y65gB2DFm2WUkdUb8A9hqfkB+JN94UetWCjBl32azfRU7HtFaUTzFZZMPI0QJmuZtwLfQrDuEV5YRcdKUiMlGSjogu013/M/A3ZdZY8UADRPurCqPz/rpN7lEXHUcSoipmEZNws8bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706606095; c=relaxed/simple;
	bh=3FnQlKo6SaNH+g3cH15aB3AH8ZobG1njkY0YS6RtZYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbhnWgCcmNOVa9eeLhJD2eZWaSK9cSAbOZtB9p1ww6EHazUOrFCD0ueLZDYCUhXZXvTNfmk6jrAkmLv1R4KuLzHLzGob3WnvJ+5PgP67RZp4mPEwSaH1on9av/Q6c71PDt0LgnRXs1Ia8Lft4d13I93GBIoOMObrDLYJ2DcYh0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7PpUP0Q; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7PpUP0Q"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d043160cd1so24744421fa.1
        for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 01:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706606092; x=1707210892; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3FnQlKo6SaNH+g3cH15aB3AH8ZobG1njkY0YS6RtZYw=;
        b=i7PpUP0QpWRoDN2HLUuXkqbNvujxOZ7ZDK7pHcm+3JUGoj7GriwlxBHN2ktMQPmWYR
         txgWF+Xwl6tfBvFJyZNSEPa3HQRu5nEcCgsUkuk8ANQ/GnZoXJcRUfQTZbVmRtKmGO2O
         NCu8KMAQ34xdybfe66w9MgjMbtKgqF9fYmH+m61q03GOAPzlkOYg1/S48h2rJgbw/EW6
         xNXj9g/3/9b/bGky8ZkW3mWXkkcWakMzmnMU0xJo6d0hIH4vrQ1nuwTgSNFdUtLPTft8
         cay46oyc5D3kD1UkBHMqnIRN3xn2Xzj8Ns05WXyTPsDMm2ncLjt+ucj7fOE+4+7hWK6e
         qKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706606092; x=1707210892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3FnQlKo6SaNH+g3cH15aB3AH8ZobG1njkY0YS6RtZYw=;
        b=s0IvXrkHnq0xNdt6PTEz/94mtpGDlgNmzKPR9qow3o40TnA6hKsEHaBcBtT2pZLCPn
         c//LPul7PjDusxsLx2yoEAmiraAdfaT68OarGyjGKCZbE5tCoY1CG11hYLaCW6NG0DaD
         lnVUKXTdaI6ce2m6xf78+btRwNzQk84j6HIr7iEqYSWHzotMqMEc5t2jqCeoy/UToatu
         uDOd0btNAerjMuzOqbExekBU/BBrEXG+G3Ke5C2XHgEEbhjv6FGSvGCdE4qeha0rGCig
         Yk2gqJpmBolKD81VM4UXVRIjvr51jie7vX8GrKsLOEKXFP0E5mCMMQmqsOFferU9TVde
         bhJA==
X-Gm-Message-State: AOJu0YwxlHytk5KfserEgPHoH1HwpjOslumEVVjAHjw4N+Y8jNeQoffK
	UJEanbNMGK13G8LExMmi3zdSj7RaCfhsFhnRqEwtyM19g0C17eaFq1cgXQjEfgsnIt9XDmyZy/k
	mC2xT/2zK7cG3PP9yol4k9LVRan7J0FCuLuS1mD++
X-Google-Smtp-Source: AGHT+IFdcmDu/YEzhxTD8C27SGNojj1TQTOYwIcfHkPembpEnGqCGYqP/B8aNCowiTia0Wf3VQHBYHw9hd1Qqe4uoUc=
X-Received: by 2002:a2e:8046:0:b0:2d0:50f4:ed6a with SMTP id
 p6-20020a2e8046000000b002d050f4ed6amr2278850ljg.53.1706606092251; Tue, 30 Jan
 2024 01:14:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUW0GvM1+A3NKDYRrWhW+eXZj7s0uksR75FMCChkAqp_2A@mail.gmail.com>
 <20240129203518.GA1851901@dev-arch.thelio-3990X>
In-Reply-To: <20240129203518.GA1851901@dev-arch.thelio-3990X>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 30 Jan 2024 10:14:15 +0100
Message-ID: <CA+icZUUWOLA7YU823tuuTVCkWh7dBVF8zOMCREuLVEXFnT2izg@mail.gmail.com>
Subject: Re: CBL issue 1984 - AMD64 segfault during LTO building linux-6.7.0
 with clang-17.0.6
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 9:35=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
[...]
> LLVM 18.0.0-rc1 should be coming out very soon

Released!

https://github.com/llvm/llvm-project/releases/tag/llvmorg-18.1.0-rc1
