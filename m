Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0174A3200
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 21:37:53 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id w1-20020a63d741000000b0042c254a4ccdso1737357pgi.15
        for <llvm@lists.linux.dev>; Fri, 02 Sep 2022 14:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=7p/pVhO//z9oA0+3ehhWhRYoWNhMazEWabTOfrMwCBI=;
        b=U1FspX5pOwKhMsjcfEYWr4CxrOAVY+erKLliXFVLjDu3sVyCqFx4ZJQODymf1S33Gn
         tYTcl5Z/41D/yViGp4Z/FGV8UcCPsuZyQ3HU6okNj5bU0RIkAdaOeWV8vU1u0doXK+Hx
         GPQ5vZLBwP/M872C1Y7kJQXecwH+Q6Ed2TaMsmNt7Cmgf1Gjlxb5mOW7rWqu7wkCcDsn
         apas//jQRnAZhnowwCsVjjICO8uszZRpBfjaUJTKVCa3wLgSsj3MRi4Egj0oALmkH/6N
         I5XjzJQtvasfatbOdAjMjyGJG+mh5X/SllQ/C4taSBumlS6FFnvYTnUB4oTN2nMai1eq
         0AmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=7p/pVhO//z9oA0+3ehhWhRYoWNhMazEWabTOfrMwCBI=;
        b=0OwksQuecZXtnGItPvSagiF2wUHpW3nzeNu7bxTk6VB/li0VwhXO3digAia3wOK6xY
         SFC68lNxkiR7mbIBKXuY4HKOwUkBeOHVqL6ta131hzrDMwGHkQzgK4L2zB2cakIj81AV
         nc/ikP6My3fkqzy029wOlVoRe8UwHuzt8kJzA9W9+7DQqLznYG3Xn5GV6HBE7wOdaUoF
         60cWMk7Yb7g2HLpkVMRKeysdg9QE328YbLvLyB3s4577iq8DmSmfD699Fq91vjFg45j+
         Be/unfujWqRIZ0foAhQMCzgH4h0pRjuGH4U1os8r2+g+pOpvNBV1Y6vL2Mcn6fOtxY8b
         CV6w==
X-Gm-Message-State: ACgBeo3F5sIZhXKrL1I/xA7Go+WBerEcp6pu79Mi1slF35XAUrj5pEWm
	zhVihrS1wUMShTpA8LnFIx8SiH9L
X-Google-Smtp-Source: AA6agR5XXMHOWPNcXrKkV85Ex9fZaKzKDDVsBUrKQW3EtDnjJ5uOdx4Ej5tXEX0NodrvKRD2/dRbCj7bsw==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a17:902:b68f:b0:173:188f:5fa1 with SMTP id
 c15-20020a170902b68f00b00173188f5fa1mr36541046pls.155.1662154673445; Fri, 02
 Sep 2022 14:37:53 -0700 (PDT)
Date: Fri,  2 Sep 2022 21:37:48 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220902213750.1124421-1-morbo@google.com>
Subject: [PATCH 0/2] fix clobbers list with ZERO_CALL_USED_REGS feature
From: Bill Wendling <morbo@google.com>
To: Juergen Gross <jgross@suse.com>, "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>, 
	Alexey Makhalov <amakhalov@vmware.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux-foundation.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Cc: Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

The ZERO_CALL_USED_REGS feature may zero out callee-saved registers. This needs
to be properly modeled by things like code alternatives. Otherwise, it's
possible that a callee-saved register would be expected to remain unchanged
past an ASM statement when in reality it isn't.

Bill Wendling (2):
  x86/paravirt: clean up typos and grammaros
  x86/paravirt: add extra clobbers with ZERO_CALL_USED_REGS enabled

 arch/x86/include/asm/paravirt_types.h | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

-- 
2.37.2.789.g6183377224-goog

