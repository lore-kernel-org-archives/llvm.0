Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ABD2206A2
	for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 20:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873881; cv=none; b=mpo3p1h/7HmMG9SMQP4Iktc69n1sDkG3+8c76p7R7i2BHROSqE/WrLQJGIC10NvO36OwAJNIAQZma+tHmS4QOIFMHfHa6gxDc9aWfXztESLwLVt6XUOWB7mz5grraOWk0b0EIEC1toeAvRSad55MA0ECTSDZ+1sqAepx2csVEOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873881; c=relaxed/simple;
	bh=Y1kfu9Z+QL2uu7AjVyJUXKJPHvRaR5bEkxSSmhH3KP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=of23Xz3X+Xku82wJtYqYc2CN3XRt2jrJl54lWVQB3Z071y3MV+0x1/oaQ+4T8f89gGaShtqjakzHjijOhwVgrAjaa3S1HlcjWAViLTcDLLRfiw13GY4BlH6zTzqurbneKNk4I+Jfw1pdOfml9Kr5PNLSCQuJ4NCyh5dZVH4yrtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eEzjdbry; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eEzjdbry"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f435c9f2f9so7416379a12.1
        for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 13:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745873877; x=1746478677; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AuAi49HAJJQIt//Ur0G31c7rmQctMxdbA26IlvOPDzQ=;
        b=eEzjdbry0F266hMm/E0k+V5JB63qet8G40wr4YXSlMdtEGQZKHuFneo2BBLFs1Aa61
         Dgu/4GKExTU5rD/5FvSLsBbh1e2vkUqtciAIbXMlnwiNmm1tyz/VNazC3J/etyvgv4L5
         HAhbfpoNF0orPbvh+u/JsuIdp0McA1j9//L8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873877; x=1746478677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuAi49HAJJQIt//Ur0G31c7rmQctMxdbA26IlvOPDzQ=;
        b=rgjzn+SDMx2GlkZfZP6tGcCmHN/2lnxRoA4eleXnB9UcK+gNRaXidEDBP2BJVcqJKi
         zF5PFbx1U+l/TxrP3SVR2llz3LusGx4vjcEmhsNzPNv+ue158HlbGtdByTnXrR9Ubkhg
         7T9S+lZWV6x5Y+j6MAjfWdRVZLWTEUofBn58/Lb00csERoRVnxI5jw5lS7AxK5MjgJHi
         GIcd0hrPeKWRkcFv3o7Ju+WQ1asna3rMGVJB8eh11jd/QpO2V0Zqk2dpD+tiQJJxe+8J
         4n0IEjfVvylYzbcJ8CXlAblY+1KXQMrkQU/iyiWZZ2Pz0KiWmRaNCwzFnZLgEIRWl+wL
         K+6A==
X-Forwarded-Encrypted: i=1; AJvYcCWHinCZD+x4p+PMlZMuq/9PMqhlMbfLUgFkgDRauuxtUuM9TtVW5xAm00h6p6TmCpoVDJiZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxtFMspmV/fBiWDSKet5XD68TC7xLLZX6HOkrop3HjZldRJzFBc
	ZGcHr9nmVj9z0wibNxuznVmLwAQ2JpVv0vUVvdkEYmOd/aiwsVB0EtzONzmF0p2o6qYrigHLwfv
	YjsphMQ==
X-Gm-Gg: ASbGncuscgJv8DbGwozZh3ykkcfNUruwVEZ26vDMldQxUwkhCu+C8clx8tXAPwd3cyc
	pGuiMRxxoN4iw3hzoE78CZQGTX1m2oGflUuTOjLFSKwMbvPQrnPhXdiIE2RVEtJ9FZC6WtFgdch
	O2IsQFEcyyqEAIy/rsZsk5xn5GUf/guru5h+3vz9RB8px+G938mnZmIde7by+tjv126Ivc44SU5
	PPmPlZlVj+YHBpXGO4Oen2NfNNJM1VquLGtj/m1pyj2Y9P5HxYdh1u9N9gZ7PRX+u8neXomd53o
	xbwKpco9/Ckvf3tbqa81ygm/5GYv7yaJcZBYWXW7gd4yvKslfC/Kfyo5caRhQhUWiz0M/LgTML0
	dbWUvDXMTFP6AzrU=
X-Google-Smtp-Source: AGHT+IF26mzLXZ6cAcZYN9jMPOjyr1bUC1YvzxSQN0sSy8/3SCZ0mlTHjSVo2oR4tq9cOfPJDDHjwQ==
X-Received: by 2002:a17:906:c108:b0:ac7:391b:e688 with SMTP id a640c23a62f3a-ace84bd60e4mr804509666b.58.1745873876650;
        Mon, 28 Apr 2025 13:57:56 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035462c2sm6302168a12.58.2025.04.28.13.57.55
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:57:55 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2c663a3daso1037347866b.2
        for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 13:57:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6VL6eEi3mhTD/JQ5cOfj6DUYJl1sGERYlas6hJZFq+z06+CQ5hDYO5LqZ6OCx/3qPKB0y@lists.linux.dev
X-Received: by 2002:a17:907:2d21:b0:ace:6e8b:516c with SMTP id
 a640c23a62f3a-ace848f79c7mr950122666b.20.1745873875562; Mon, 28 Apr 2025
 13:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162> <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162> <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
 <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
 <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com> <zizdtmyqqprnlgy2rzvvmqzhganxpuxqqkudhwakianlapl6zp@zucf2xtoabez>
In-Reply-To: <zizdtmyqqprnlgy2rzvvmqzhganxpuxqqkudhwakianlapl6zp@zucf2xtoabez>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Apr 2025 13:57:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=witM==gebAaEqr_Z9jV-Y7i-=w_tfMovzhgW+VX4Fwkmw@mail.gmail.com>
X-Gm-Features: ATxdqUHVoU0fqtTa0EcdInlUrRY0LAso2qHrbrMUyXdvOmWof2RJdPZnjJYyf4I
Message-ID: <CAHk-=witM==gebAaEqr_Z9jV-Y7i-=w_tfMovzhgW+VX4Fwkmw@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 12:54, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> BTW, I've noticed Clang also generates UB for negative shift values.  I
> assume we'd want it to stop checking for those as well.

Yeah, that seems to match the exact same issue.

And again - the correct fix would be for the compiler to not do extra
work only to make for worse results.

Note that it's different if we *ask* for -fsanitize-undefined-xyz: at
that point we're literally asking the compiler to add extra code for
reporting.

But even then we absolutely don't want the "fall through to random
code" behavior. We'd only want the reporting part, and then still
generate valid code.

So the "turn undefined behavior into truly random behavior" is *never*
a valid model.

It would be much better handled as implementation-defined. So "divide
by zero" would have a very valid model - it will raise an exception.
And shift by negative would have all the usual semantics on x86 (the
shift value is just masked).

Undefined behavior is a bad bad thing to try to take advantage of.
It's bad in CPU design, it's bad in compiler design. If we have a bug
- and bugs *will* happen - it's a lot better if that bug then causes
some reliably bad behavior. It's better for security, it's better for
debuggability.

            Linus
