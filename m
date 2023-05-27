Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18119376
	for <llvm@lists.linux.dev>; Sat, 27 May 2023 18:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685212264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cPGzPnaU4Mor65p7Y4IXkmc1zlolHHAd8WpJTWVO/wE=;
	b=JHN2SO2wqr+tV6JDJgkHLcqViJkqvaJEyiv3DWm93cVrzmik7/V2kVxMX8rYcJFvNQojj1
	rfmlvV1c/ms/0bcK4kssvUCfyaDS+SmNTkBrYDecIt3sgjRV/cXX+5AsC9xoVuGIKOCiKI
	pRlXkGJ3fZt/qbW69BkugFVQaZG2lLU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-PSB0Hzi8MiSaYDZNpJlo9w-1; Sat, 27 May 2023 14:31:03 -0400
X-MC-Unique: PSB0Hzi8MiSaYDZNpJlo9w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6281F3804069
	for <llvm@lists.linux.dev>; Sat, 27 May 2023 18:31:03 +0000 (UTC)
Received: from [172.64.0.126] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 505B9492B0A;
	Sat, 27 May 2023 18:31:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc3,
 mainline.kernel.org-clang, 4e893b5a)
Date: Sat, 27 May 2023 18:31:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <88451.123052714310300183@us-mta-471.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: SKIPPED


Kernel information:
    Commit message: Merge tag 'for-linus-6.4-rc4-tag' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/xen/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/90542

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/35541=
4


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

