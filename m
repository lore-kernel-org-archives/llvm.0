Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0433E2CAB
	for <llvm@lists.linux.dev>; Sat,  4 Mar 2023 22:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677968408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KKW7xmP6ipHgRpT5awnHJ7EBJqdPl+xwhicimR99Yfw=;
	b=SLqmNER1RyoKHlSqf8IedlmfeA8OhxsPVO6msYndniEcRFlofMOs3Hg6Q95I2iYd/r5mOl
	dSGeTKX0VO4y/IcOHfvmp7ghI+PQ9alNx+a2UH78MYDqW0sKeJI1HyuOmXC3N23W6yUuhn
	9GH+M1qZLVuB2ymho+MloWKZLHIJao8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-42pMnrUyMK6kdXO5bctGeQ-1; Sat, 04 Mar 2023 17:20:07 -0500
X-MC-Unique: 42pMnrUyMK6kdXO5bctGeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C16341C0519E
	for <llvm@lists.linux.dev>; Sat,  4 Mar 2023 22:20:06 +0000 (UTC)
Received: from [172.64.0.76] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4F212026D4B;
	Sat,  4 Mar 2023 22:20:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, c29214bc)
Date: Sat, 04 Mar 2023 22:20:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <37687.123030417200700112@us-mta-568.us.mimecast.lan>
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
    Commit message: Merge tag 'powerpc-6.3-2' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/powerpc/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/76105

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31929=
4
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31929=
5
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31929=
6
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/319298
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31929=
7


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

