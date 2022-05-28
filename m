Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FCE1FA5
	for <llvm@lists.linux.dev>; Sat, 28 May 2022 09:14:33 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id f4so5886161pgf.4
        for <llvm@lists.linux.dev>; Sat, 28 May 2022 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z1RqzTeW1BAGxPPylhaGGZ1c6ZvnWii5iv9aspactB8=;
        b=hnsC8bvhVQEneXnjOD8hIdRXhfn8Wy5bKpsD9Q5o3YlAfnNnhMueJbaHnYoSYmaQC7
         RLoGnI35KSHpk7Okkdw9SADICr2qYF6shUX64/2kai1UPkHhWK7mv4Wmuj1+fV67KBn4
         xUTHkiVLcK/NLqkIe7qZyYNfoVjP4sEGll4uFMe3/cStcibJSj1UJjUZYu0kbShFI7W8
         Bpch32PsNAlKj+nt8SNgUZY/EWXGftGHs90XdHxEKkW3wd3tdYpptymqdlWpKddQmu42
         8WzK+RCzFdobizDPkVOxZoFmrPpg53d2TpD6dFZnjTB6nH/RMSsyq5kZXf1iEdOFE73N
         h7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z1RqzTeW1BAGxPPylhaGGZ1c6ZvnWii5iv9aspactB8=;
        b=QumPZ6g2gW/3gDz63S8f1AwEaDOXmaL4VEOJS9d7Ld5zhraoJ1Gm6W/kMnUu3d7Ily
         Xz/vJEznvxS1o2hUKhfT2L8SdjFHLCtUs7joXlbZr8vC+OdGxRAZKgJaurFE+GDB9Llu
         kPJCTX03wYZ3NP0jmLdyhwVyNItNRfcZyGSUKyD+ewjvCn2DtoNixdc1rps57r2E3kth
         ZX4X8yAmvhjXZVcMtP7SQAwDRhpPFWU0BYkCOIgwrZOXZACZx//5jPZkBIzZ0pmMD4qp
         d4ILBDdQ7gLRNBsnvnz653+IpO5nHxRgVgb2jp9AJLdFGXUOWcZgNZjMT1ofqq7SmNZ8
         yUoA==
X-Gm-Message-State: AOAM530Pnx4/7SoqMIwSB/RyY7WOUiN9WSnulOxw5qxSSAZoO6IywGZr
	YCa9HSpIBYRIRg5lHaId9Yo=
X-Google-Smtp-Source: ABdhPJy0yRgS91Kx5W6REvKQcbGpfooNjaA/QHpmbeacl/6LtY6SUrfXKOj/470iNJEPSzd2aAFx7w==
X-Received: by 2002:a05:6a00:e8e:b0:4fa:a52f:59cf with SMTP id bo14-20020a056a000e8e00b004faa52f59cfmr47726914pfb.84.1653729273229;
        Sat, 28 May 2022 02:14:33 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-83.three.co.id. [180.214.232.83])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902f68c00b0016198062800sm5320179plg.161.2022.05.28.02.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 02:14:32 -0700 (PDT)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Nikolai Kondrashov <spbnick@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	llvm@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] HID: uclogic: kernel-doc fixes for uclogic_params_* functions
Date: Sat, 28 May 2022 16:14:01 +0700
Message-Id: <20220528091403.160169-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.36.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Running kernel-doc script on drivers/hid/hid-uclogic-params.c found
these 6 warnings below:

drivers/hid/hid-uclogic-params.c:48: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Dump tablet interface pen parameters with hid_dbg(), indented with one tab.
drivers/hid/hid-uclogic-params.c:48: warning: missing initial short description on line:
 * Dump tablet interface pen parameters with hid_dbg(), indented with one tab.
drivers/hid/hid-uclogic-params.c:48: info: Scanning doc for function Dump
drivers/hid/hid-uclogic-params.c:80: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Dump tablet interface frame parameters with hid_dbg(), indented with two
drivers/hid/hid-uclogic-params.c:80: warning: missing initial short description on line:
 * Dump tablet interface frame parameters with hid_dbg(), indented with two
drivers/hid/hid-uclogic-params.c:80: info: Scanning doc for function Dump
drivers/hid/hid-uclogic-params.c:105: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Dump tablet interface parameters with hid_dbg().
drivers/hid/hid-uclogic-params.c:105: warning: missing initial short description on line:
 * Dump tablet interface parameters with hid_dbg().

One of them is reported by kernel test robot at kernel test robot at
[1].

[1]: https://lore.kernel.org/linux-doc/202205272033.XFYlYj8k-lkp@intel.com/

Fix these warnings by remove extraneous asterisk on static function
comments on patch [1/2] and add missing function name for void function
on patch [2/2].

Cc: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: "José Expósito" <jose.exposito89@gmail.com>
Cc: llvm@lists.linux.dev
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Bagas Sanjaya (2):
  HID: uclogic: remove extraneous asterisk on uclogic_params_* static
    functions comments
  HID: uclogic: add missing function name in uclogic_params_hid_dbg()
    kernel-doc comment

 drivers/hid/hid-uclogic-params.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: bf272460d744112bacd4c4d562592decbf0edf64
-- 
An old man doll... just what I always wanted! - Clara

