Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E06848A
	for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 07:33:41 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fa16c6a85cso6422289e87.3
        for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 00:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689579220; x=1690184020;
        h=cc:to:subject:message-id:date:from:sender:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zKmKTLXmJl4IrI3KGjrhzWyQ0jqbt+qmfLrIaf0PAGU=;
        b=iobThYhNpDHxZnDA6QuqHF86pJZGLct0jCkDjzO3zcGgnbHdGXmakdE1LMTRTcYpVv
         QBD6jVfccuJTKW12RCRkdz08UXaTmJPyhPGbv5A7luiGJM0/46RC7EDTzRbNHw/XqktA
         zR0AM8fqk8ye3xFqFiRLqem0w98s1D0GUZg5xKxLa1LBsRQrQRz9EqjEwxuYOd9r6Aul
         TD9VruFawZ9NA0daPV4dkyX478Y/O1UbDflpWoGhmkg3Uea8dqfXvFP3fjTxnQr685Xa
         HG+RX5Ar5ttNM24bORCK9dCFGQOcaLCx3iKQsCyHq+ZVI0eqzWA/NejdYWHKUev4lct3
         RZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689579220; x=1690184020;
        h=cc:to:subject:message-id:date:from:sender:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKmKTLXmJl4IrI3KGjrhzWyQ0jqbt+qmfLrIaf0PAGU=;
        b=Oi4hFOC6FHd7BjpKi2ArC1ug5ZXmjbh/u0UOwsW7gR1C+OHmppv1pTmh+qNtkZQsSe
         2/FN/Jc52i7+r9LduLM7HVda3jeWcMVusUleXvlVRsdKzBhuifFLOgGgO8NPiF7coWVh
         pngusOih1NMUxKLFDU2H/epQMmZN4l90NwJaITZodykX0VXhU+ax8uT/bGgzwUZlKkTD
         gynvUlrekID/6ztvbxkwE3dBGSDNmT5DG3E5GEzrVhoZW7K68fmzReVmAJmMflmD+UmO
         kYgGX57X8geFJVuAYt0EjkwG5SqLCSNCO/ART9WVJcKexEIBZv6vJMPo0fluT5/2NlQJ
         gUPA==
X-Gm-Message-State: ABy/qLYNHUpOK3R/6TZEccfFE5QUC6K6ntJIGFP2Ig33nUomcurRImgt
	DRyJnEpQV55DfeKoIUjkfesewv5nXAzaAVnBA1Q=
X-Google-Smtp-Source: APBJJlHQEvGi3Ct7TFoNtazDB7rZ7iTGxDDTzR5N7f+0zVIYzKF94V7loyXlmdCDO7y+FlXdlkGR+kI69zjgGHXy6gY=
X-Received: by 2002:a05:6512:2384:b0:4fb:8603:f6aa with SMTP id
 c4-20020a056512238400b004fb8603f6aamr9287175lfv.11.1689579219583; Mon, 17 Jul
 2023 00:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <tencent_8D245D1A87D17619EA8475E8F005A151000A@qq.com>
 <65f4c60a-9534-56dc-099f-ee7a96e0ccaf@redhat.com> <CAKdjhyBRcCFDiA923x0FLNYzs5vafENm96iAqV2XiDD_eTWBUQ@mail.gmail.com>
 <ZLFFGLQ6H/9RCaVf@casper.infradead.org>
In-Reply-To: <ZLFFGLQ6H/9RCaVf@casper.infradead.org>
Sender: cl1ntlov3@gmail.com
X-Google-Sender-Delegation: cl1ntlov3@gmail.com
From: linke li <lilinke99@gmail.com>
Date: Mon, 17 Jul 2023 15:33:28 +0800
X-Google-Sender-Auth: QVA3zl0oXRAlFcNIMYheonfzC6s
Message-ID: <CAKdjhyDMZBq=u1yphU=gTqb_if02ji2Ubn2mytHQ1tcypPiNdg@mail.gmail.com>
Subject: Re: [PATCH] hugetlbfs: Fix integer overflow check in hugetlbfs_file_mmap()
To: Matthew Wilcox <willy@infradead.org>
Cc: David Hildenbrand <david@redhat.com>, Linke Li <lilinke99@foxmail.com>, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, trix@redhat.com, 
	ndesaulniers@google.com, nathan@kernel.org, muchun.song@linux.dev, 
	mike.kravetz@oracle.com
Content-Type: text/plain; charset="UTF-8"

Thanks for your reply
