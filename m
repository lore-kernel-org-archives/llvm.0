Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D47EC8
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 17:23:00 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id q20so11769355wmq.1
        for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 10:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=aRoVcBOHgM/bPJSJSqXhRaIwaT3UuhMY9GonRHMXbqEfftdO0iIwyyW/iDkbCVTA+e
         lNKBzC3Po3YV8/FIHb59G0SaTYApGQwOdaAk4JTTI7rQHrvX5CjAp9Z1C0G/2MtNXuoN
         fndArZZiBp/+Eq/1j1NXFzXmsohvZ6Gd/hULxlIoJwVu1E13X+DZKiPiOLpgPqbpeCi3
         SRMNMfnWD0WRbvPh7VfsNnyZaFN/DcfZrmwCKiEpobCRDKDF3ffHqcJkK6b0OxT7vGFx
         Z+QEBaeN8aIOtMOuNbKHShBjLjpMu6c7mKNsF/lRhxu6zS/+f6RC7pU+LzFAykulzgOH
         Nwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=GWwBi875bigsKxB+xayVI/eiRWn2i89Kn/XPsR724ZsnBIEL1fI4OJ8RLItU/rNl8Y
         Qxm2sDQg74LfDF+C57PVG5XPFGpB9cvZ7tuuXPcjanmqwWuRkSpLQuUF+5Yd6iQOro8f
         KVrQFrYusz0PZWyhikt+jZngAeDe6zjI5h+mGW53RQd09ST/6JB9wfL/+lglnjrwZyuX
         3kLJ05X0pZVMjxRXv4zleitJCQyYekekyuhxHgO8RxOwg+CuS+bMOoB6BaxB5f3hgOWN
         pJbYG6GcIfRrF2q1YrWJVMnZplvLrdPjU/T5IXDr4bLTVfwvGG88st/ADkfrA8juG/D6
         Io3w==
X-Gm-Message-State: AOAM531IBmkJgwEWSp7dUW6Mc5ZzwRMgTvWi92JL0NlAFTKN/eMB3nnB
	uw43c30Po+erx5crN5LrbG8=
X-Google-Smtp-Source: ABdhPJxEAXXzHubn+advKnJbYKpYFmUIB3ii3RqP1kAQOxL/SWRw9xfmj4/gWfLzVzKc22HV24m2+A==
X-Received: by 2002:a1c:e908:0:b0:38c:782c:2a62 with SMTP id q8-20020a1ce908000000b0038c782c2a62mr4742238wmc.135.1647969778541;
        Tue, 22 Mar 2022 10:22:58 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id d15-20020a056000186f00b0020384249361sm18516828wri.104.2022.03.22.10.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 10:22:57 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] KVM: x86: Fix clang -Wimplicit-fallthrough in do_host_cpuid()
Date: Tue, 22 Mar 2022 18:22:52 +0100
Message-Id: <20220322172252.269813-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322152906.112164-1-nathan@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Queued, thanks.

Paolo


