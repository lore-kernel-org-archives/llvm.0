Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8BE2109
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 21:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686950410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LBdAvsBPsCAUDvRFyNg5HFOBp2bev8+o0VVaJXScvKQ=;
	b=Ccnf+3IXHgoaTOR9b5znrGyi5z5dyrhQsxbr6Lt534jD2iDrGLzNiSjNH9idSu+zSS1uo3
	j4KxW3LzHthPBmeQOQlfPrsMLgftAb9hiuYJyGkA35NzQgLZAoPCdlZS78MsFjmGvpkq3A
	C5CEnJuG6Pq0JTid22Y9TwxOcU3GBc0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-FeOSUFy1O0afohxPe-vx2w-1; Fri, 16 Jun 2023 17:20:08 -0400
X-MC-Unique: FeOSUFy1O0afohxPe-vx2w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9893D1C04B45
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 21:20:08 +0000 (UTC)
Received: from [172.64.4.14] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 797F4515540;
	Fri, 16 Jun 2023 21:20:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc6,
 mainline.kernel.org-clang, 4973ca29)
Date: Fri, 16 Jun 2023 21:20:08 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Message-Id: <75553.123061617200801172@us-mta-550.us.mimecast.lan>
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
    Commit message: Merge tag 'for-6.4-rc6-tag' of git://git.kernel.org/pub=
/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/92870

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36301=
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

