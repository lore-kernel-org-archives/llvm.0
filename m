Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DBB8121F
	for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 22:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719615365; cv=none; b=V+G4OUPZTczkw53nNRNccWI5hEUJfKqGJ4zdqg9ZUgOLvPagD65A3JjieQizxdbmqmZiS5irrwzq+Rr3jw1/vdM/SIYLkVpey4Hukt4FqM6KErruSxEqUvGjnebHf+aRUbGOb7vPqMutCtREG+DudYnJA++Guajxr4MEGNjRGjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719615365; c=relaxed/simple;
	bh=LVM3uqkTSyhKCZpetJYUvE3Yr/mF1UV3sFe8vrzMhE8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LWQVqRjrhQyqPp61iufn43SJvWSC9FWI8kUDYastyd5m4j/p6XKmndJcxEkxUR81xO3hxwRyTX4UdxCQ3MpCrdV09PekB8tk7TL1aX8ZWtqDfNdXroX0pqCzFpVuz4Zh8BSRewBzCewTkSYTX8G3IjpUY0cNwOAR/IbAZkFZ3Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1WOoHkDk; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1WOoHkDk"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-6818fa37eecso952687a12.1
        for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 15:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719615362; x=1720220162; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ttnlucE2BUFc3AsSQbZS8PZZ80YXekALgZ+NzdoS5mQ=;
        b=1WOoHkDkJ8K9QW783OR9fQUA2ii/800sIz4sGeEin3HzNt0rQ/AWIsdS5G4qjkQDIx
         mVE+Yqt0rBK+9XxRSpuvuzlVVohTWJHuTW214XLivcy6KZRRIwgX80eNTpjPymL2Kxp+
         zRwS1wWbDAynVlmGweonGhm+XnjMFRfy8TnHBGVEgyRrPtpbmSpSVN1+iKPWuerJca4Z
         y9Y4UQWhtbi3fOs/8poDp5D0Uiwc6WfrgZorp0F63JHaLjDUAhzXUtgryUGeWkeZ4OQz
         cx11T+m8GTx9YaPI0aiGep3ZHCZMrp/s+be1CRKgnxduuh/ys3TV+qItWdQ+EIZMgtDa
         HTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719615362; x=1720220162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttnlucE2BUFc3AsSQbZS8PZZ80YXekALgZ+NzdoS5mQ=;
        b=wpKSH6qGyUHECX59064BOKLlm7jfBbj97QTcrB0l54/ODPaGX8U1CzF5a5F9/hQAlx
         9xKUOLPcAnUzR4Kipwi4FDJibQmkO5OdK4T3TJAUjA2lE7gGXg3lVGRJ4fRFx5+ySPZd
         l3CzzJ8N5PfLGsScU7SPPos12dbfpp84eMqolZjsaNg2QkWKh32hx3Wy/z+09+/XqcZe
         SsKITIsQkrtrMcVoM/xwJ1H0WjkkmmVuIAw7GcNosOo2BDg8FX6ZmnDVq4VzrX2yyN6f
         voA4M/1DfShf7Fj9emvLHQEvZCw4P5bHgUyOGLlSzXbS1Y2GrbBmZjD8m/IccmiWTkTq
         JLtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBLutj0DIywu8nRffPfH7cdGbWz04wLlyEvK8gQdvfUaDIALUX+2nef1VlXFjt59FME5EtHEO7UBX9g3KvG8DoBizIMg==
X-Gm-Message-State: AOJu0YxaJiH0P5v4lq3pKvtJbqML/PHVBEDLm+SU+X2rfglpunuEed8r
	t+7L75zyLslsckkeXdqZpbVan6hBARXrHQikaZ26S9QbeBLLUZbI/SPLNU6I7/CqLcJLUBXti+M
	KBw==
X-Google-Smtp-Source: AGHT+IGhT9nWsTP7CsdKQU4fzRBs3sRnyPYbvYxeAui3yoao7EDlWEgc/ibfFsDaevUVjLGQihFbGVHjUFE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:3d04:0:b0:6e5:62bf:f905 with SMTP id
 41be03b00d2f7-71ace6d26f4mr47242a12.10.1719615361864; Fri, 28 Jun 2024
 15:56:01 -0700 (PDT)
Date: Fri, 28 Jun 2024 15:55:22 -0700
In-Reply-To: <20240627-bug5-v2-1-2c63f7ee6739@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240627-bug5-v2-1-2c63f7ee6739@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <171961374413.228500.7729150745631933428.b4-ty@google.com>
Subject: Re: [PATCH v2] kvm: Fix warning in__kvm_gpc_refresh
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Pei Li <peili.dev@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	syzkaller-bugs@googlegroups.com, llvm@lists.linux.dev, 
	syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
Content-Type: text/plain; charset="utf-8"

On Thu, 27 Jun 2024 08:03:56 -0700, Pei Li wrote:
> Check for invalid hva address stored in data and return -EINVAL before
> calling into __kvm_gpc_activate().

Applied to kvm-x86 fixes, thanks!

[1/1] kvm: Fix warning in__kvm_gpc_refresh
      https://github.com/kvm-x86/linux/commit/ebbdf37ce9ab

--
https://github.com/kvm-x86/linux/tree/next
