Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BAC171C4
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 23:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691536807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NzK8thHujIuxL8YS+HjFr9/A5mo4w5EnVOvu8xSrF7o=;
	b=PVCwXlsuamavjx3CcQpeu//yQpR3QrWVqU2nS2gNxp1tMYywxUNQFddm8nVaeiHgthUNk8
	5Bta+ZcJta7AV3zh1MwIkzNiLGLDkcxhci4MCnIwWBQO+U046mnn3gOlTU7qL2Nx5gYxN6
	a/JBvuIMFNOiuehy4e6lDasfVje+I50=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-bn4b906_MjCiFc3v7_XDhQ-1; Tue, 08 Aug 2023 19:20:05 -0400
X-MC-Unique: bn4b906_MjCiFc3v7_XDhQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A135E101A528
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 23:20:05 +0000 (UTC)
Received: from [172.64.4.35] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F6C9492C13;
	Tue,  8 Aug 2023 23:20:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.5.0-rc5,
 mainline.kernel.org-clang, 13b93720)
Date: Tue, 08 Aug 2023 23:20:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <65471.123080819200502409@us-mta-68.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'hardening-v6.5-rc6' of git://git.kernel.org/=
pub/scm/linux/kernel/git/kees/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/99212

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/38297=
4
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/382975


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

