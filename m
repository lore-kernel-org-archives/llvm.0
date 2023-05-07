Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383A92598
	for <llvm@lists.linux.dev>; Sun,  7 May 2023 21:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683496264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lLu7uUgBvHLVgLGbBbde+v3/lEOoMG5AuEtPt3qmIqc=;
	b=eBkE7Nze+m3/s48zJDilBiqsjJ3HaMsJ/GXf72JDfL6YKM8gv/yUjF27btEYa6Gw00jfro
	P19P5BoffI8fqRqC1iDBVF2j1hvL5FpkapwXB4/z/BEbR0FMh4BmATcL775ga+O4ezXN1O
	lul2cyZ7cs2YF5cKDFzkZOuXAkzhZG0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-ufDaM7WTP3K_SLTSN3a-kw-1; Sun, 07 May 2023 17:51:03 -0400
X-MC-Unique: ufDaM7WTP3K_SLTSN3a-kw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6765B1C06ECF
	for <llvm@lists.linux.dev>; Sun,  7 May 2023 21:51:03 +0000 (UTC)
Received: from [172.64.0.115] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57CAD14171FF;
	Sun,  7 May 2023 21:51:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc1,
 mainline.kernel.org-clang, ac9a7868)
Date: Sun, 07 May 2023 21:51:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Message-Id: <63436.123050717510300265@us-mta-573.us.mimecast.lan>
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
    Commit message: Linux 6.4-rc1

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/87536

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/34489=
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

