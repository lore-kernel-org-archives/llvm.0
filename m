Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD68A2CA9
	for <llvm@lists.linux.dev>; Fri, 26 May 2023 21:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685137810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bMvJeIW3P/Ce7AyNNCjnk3Q5Mw/rlr7WiKovdtTqvf4=;
	b=I5+MW16DiaK1xtsctgVXn9GgxvsnXwx4RSxSOlEUE2GIshSzWQwYg697AU1zKcCaYYVeKE
	pDsZhrCVaI14Nuz7VWGvBsXl0eV7LtVMdJQ5/lpUBFrydCP5DokTR3y6J68Ph4IJ5iOork
	GrkAeg/wri40pM0R00kSEa6uqemUo9g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660--DRPcBPXOtWIbFATKnBBBQ-1; Fri, 26 May 2023 17:50:09 -0400
X-MC-Unique: -DRPcBPXOtWIbFATKnBBBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F9CE1C08DAF
	for <llvm@lists.linux.dev>; Fri, 26 May 2023 21:50:09 +0000 (UTC)
Received: from [172.64.0.126] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15E3F40CFD45;
	Fri, 26 May 2023 21:50:09 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc3,
 mainline.kernel.org-clang, 91a30434)
Date: Fri, 26 May 2023 21:50:09 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <62216.123052617500900438@us-mta-660.us.mimecast.lan>
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
    Commit message: Merge tag 'gpio-fixes-for-v6.4-rc4' of git://git.kernel=
.org/pub/scm/linux/kernel/git/brgl/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/90485

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/35522=
0


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

