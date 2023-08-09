Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8B71C9E7
	for <llvm@lists.linux.dev>; Wed,  9 Aug 2023 21:05:30 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-56942442eb0so4167247b3.1
        for <llvm@lists.linux.dev>; Wed, 09 Aug 2023 14:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691615130; x=1692219930;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6lWbhl7iPJrKFXOG4ZaXM/5SQTR9KDU65oXklH1K4hU=;
        b=XSP08oXAlIaoTPUlKBAe8pUHP4D/Q2O4a2ikWOgwsY8iJkHrVMte8qeGH1WAkRPjCS
         HsHVcpMtQijc+gxrqpIJbF/SES253F1LNYyvO8vRPoR2DsSG6gYGSOBgIXUoRurR9Hh4
         gqcCieD5ON6Zcxl8GP2wVFyQ6YQe+5/yxQF75xbAu4Jxs8HXXwJmhpbSEz7tz2v3AOdB
         dPs//+AO2kz4ZdEIckDrw6bhF0+m2Fm8Slh3LFlTUywj3oLJ/1CEQ8IYTBzgPR7lTXhg
         TSLqBgXD+PexUSps+ZFfzaBrDF3yip37wRWT5NUSB0SddgFflFAGvoi3E6hhbD+GzKGI
         AAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691615130; x=1692219930;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lWbhl7iPJrKFXOG4ZaXM/5SQTR9KDU65oXklH1K4hU=;
        b=en5WP8Yes1Gt5MXlzhjbaSKqXVa3iP4sMYQHIsDQdbrSIphQ2c8DlW3A0WI6ncyHg/
         Xp86o05/6N4YvVDzgXymGH1GFbWjPTns4NUn2AE7mrnye0yJT6vmiX7mCB8q0PvWn3Tr
         zc1TdrA8sZU0QWX2pLeKVQnJq6V96PfCj4H16lT4TsHod1NGN9S5Y3isfqGAw+oZ5bR6
         EKyLU90a7/J9gV8hhoFRYdz2xSRM5bA0vSysjGKo+dOPOFv6IRo5KN0ttwu0XkiCFMaX
         4adc148e6lfNM9JMPP6FeU4aIA1KhIhR1KRwrdEDQZSeeyTAftgkfpmvdJCK00wN9qF0
         fx8A==
X-Gm-Message-State: AOJu0Yxc00Ccwy8NlzDvsihqKoDL22FubUpUaMXW3mhygAmkTm+LgEJH
	9/v0ovUsv48YdeAI7GfxPosy+mwXIpuc/W+dQg==
X-Google-Smtp-Source: AGHT+IFQmgkrI8VuWgIDNLZ7KR+fil6n5jwemxgi5ftyxtUzT4A3cLkr7PSGk7zkzAE0NI22zP0CK8uKN2at/Sddxw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:b654:0:b0:589:a974:d7ef with SMTP
 id h20-20020a81b654000000b00589a974d7efmr8012ywk.6.1691615129773; Wed, 09 Aug
 2023 14:05:29 -0700 (PDT)
Date: Wed, 09 Aug 2023 21:05:17 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIz/02QC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDCwNL3eSkHF1DSwMjXXNTY6NEcxPzJHNjQyWg8oKi1LTMCrBR0bG1tQA Yc43mWgAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691615128; l=2051;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=4fwVtNGUzPaNWTNSFgWLMCLfJmRtOqh+bfG+cBvU9Fc=; b=1gU3hL/wzLUxNjg0CNumlzju0uyRaxlNZsxZ08WyrI5v/J6HMXXm2wvDibGpMK6pZ8L477ovJ
 1qI9WLjjLnMASiKba2+k6n9m7GYjszkKfxYisHrJgpVROBN/gFLtblp
X-Mailer: b4 0.12.3
Message-ID: <20230809-cbl-1902-v1-1-92def12d1dea@google.com>
Subject: [PATCH] ipmi_si: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Corey Minyard <minyard@acm.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

With W=1 we see the following warning:

|  drivers/char/ipmi/ipmi_si_platform.c:272:15: error: \
|       cast to smaller integer type 'enum si_type' from \
|       'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
|    272 |         io.si_type      = (enum si_type) match->data;
|        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~

This is due to the fact that the `si_type` enum members are int-width
and a cast from pointer-width down to int will cause truncation and
possible data loss. Although in this case `si_type` has only a few
enumerated fields and thus there is likely no data loss occurring.
Nonetheless, this patch is necessary to the goal of promoting this
warning out of W=1.

Link: https://github.com/ClangBuiltLinux/linux/issues/1902
Link: https://lore.kernel.org/llvm/202308081000.tTL1ElTr-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note:
Arnd had mentioned that there perhaps may be some semantic differences
between GCC and Clang regarding this warning or family of warnings. For
now, this patch (and others following) will yield less noisy W=1 builds
and hopefully materialize into this warning getting promoted out of W=1
to an always-on warning.
---
 drivers/char/ipmi/ipmi_si_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_si_platform.c b/drivers/char/ipmi/ipmi_si_platform.c
index 505cc978c97a..0d509d683c0f 100644
--- a/drivers/char/ipmi/ipmi_si_platform.c
+++ b/drivers/char/ipmi/ipmi_si_platform.c
@@ -269,7 +269,7 @@ static int of_ipmi_probe(struct platform_device *pdev)
 	}
 
 	memset(&io, 0, sizeof(io));
-	io.si_type	= (enum si_type) match->data;
+	io.si_type	= (unsigned long) match->data;
 	io.addr_source	= SI_DEVICETREE;
 	io.irq_setup	= ipmi_std_irq_setup;
 

---
base-commit: c1a515d3c0270628df8ae5f5118ba859b85464a2
change-id: 20230809-cbl-1902-7532a747b731

Best regards,
--
Justin Stitt <justinstitt@google.com>

