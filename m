Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58656883B
	for <llvm@lists.linux.dev>; Fri, 28 Apr 2023 23:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682725309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AvK64dBJ0wIbXz/Q8ICagDlXvef8Yr2SrQsqyluB0FU=;
	b=DarET8jEWEFP2zfSOm/Uc2Q55V3SbwoMG6zbUzvScidhJVY2i48ZQ4NI3mnCB2oxScQUfg
	RBwHIEie5WZXia5YyfAOMkq8BM6GyPWKrHme6kL0xaA+RkDDe11BymUrSuruKb5B6Nqosl
	pt+VZPypdtHEj8miUcuCma4QdITBVek=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-06qiexYYOTiQmW_SvCC0lw-1; Fri, 28 Apr 2023 19:41:47 -0400
X-MC-Unique: 06qiexYYOTiQmW_SvCC0lw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 395A13C0E444
	for <llvm@lists.linux.dev>; Fri, 28 Apr 2023 23:41:47 +0000 (UTC)
Received: from [172.64.3.52] (unknown [10.30.33.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F6E62027043;
	Fri, 28 Apr 2023 23:41:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.3.0,
 mainline.kernel.org-clang, 586b222d)
Date: Fri, 28 Apr 2023 23:41:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <63758.123042819414700191@us-mta-322.us.mimecast.lan>
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
    Commit message: Merge tag 'sched-core-2023-04-27' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/86553

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/34162=
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

