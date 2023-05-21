Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C648F65
	for <llvm@lists.linux.dev>; Sun, 21 May 2023 20:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684699806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9Ok1R/IIMhdemEswsj1Dtlh335f54NeIeP4gYer8JNY=;
	b=FokcdkOE7D24N28Gad+QThP2vuXzOnxDKdcsFO5eWfpObJ1ZFEAFpzhPrTePY/dEgwbGHR
	1TDV85mcXHsqnZYtk87C9GnLk6T9/Zzfw9uFHgBQChI1LmZ9xsB/z1FML4nB4v0VuLrdvG
	o8FNmyLQhztHTqpMpCJpAv/ssdllzdo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-PpDpcGrLO0C9SpDDr7OUEw-1; Sun, 21 May 2023 16:10:05 -0400
X-MC-Unique: PpDpcGrLO0C9SpDDr7OUEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F66538035CF
	for <llvm@lists.linux.dev>; Sun, 21 May 2023 20:10:05 +0000 (UTC)
Received: from [172.64.15.20] (unknown [10.30.34.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CA56C54184;
	Sun, 21 May 2023 20:10:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc2,
 mainline.kernel.org-clang, 4927cb98)
Date: Sun, 21 May 2023 20:10:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <77913.123052116100500285@us-mta-190.us.mimecast.lan>
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
    Commit message: Merge tag 'powerpc-6.4-2' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/powerpc/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/89620

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/35252=
5


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

