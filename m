Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03F9459
	for <llvm@lists.linux.dev>; Tue, 28 Feb 2023 19:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677612666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rdXTk/eXipi4DvwFPQ8pLkSYiV6qUTGDV6tXBOtA/I4=;
	b=FkjWiNA/uVG3GbRoCdjFZPzlrdwBiouAwoNI4ZNGOUlGoqjLZB/irmnP2kpERUAISZkin6
	jnSrX9OoK7VdEgQVucmRGRfMm7SiKSboIveCXaxE2uKnblUcSngwaQtVohm1ykUlmFE20F
	cNfGcg+h4fWhWMFekAPgQ+zWjw6lRtw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-GP7IH_zUOa-bQpyMb9lYhw-1; Tue, 28 Feb 2023 14:31:05 -0500
X-MC-Unique: GP7IH_zUOa-bQpyMb9lYhw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D596C85CBE6
	for <llvm@lists.linux.dev>; Tue, 28 Feb 2023 19:31:04 +0000 (UTC)
Received: from [172.64.13.54] (unknown [10.30.33.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5A224026BC;
	Tue, 28 Feb 2023 19:31:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, e492250d)
Date: Tue, 28 Feb 2023 19:31:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Message-Id: <88929.123022814310500479@us-mta-140.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED
              Test: OK


Kernel information:
    Commit message: Merge tag 'pwm/for-6.3-rc1' of git://git.kernel.org/pub=
/scm/linux/kernel/git/thierry.reding/linux-pwm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/74900

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31759=
6
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31759=
7
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31759=
8
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/317600
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31759=
9


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

