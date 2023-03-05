Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AC23FDD
	for <llvm@lists.linux.dev>; Sun,  5 Mar 2023 21:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678052464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QdYEn3fMiRUI2KcWKEHq+vmXQAcZ+jEJ4h0HoOFn8m4=;
	b=YEDyiHVe8Viak2NK3pXyalJebbMIva714CEY6gFLyDiEkPZpYG9yO0O7AvqVTZ/2acY9AT
	0dneazmsId3q6fsYnvdjUwgVdNzJsurVnYixjj4DLSpKgGZS0xZOhTnqimrP8OoXagej76
	PxFeacahAoNRgsQDxqbJbOQLHtRkt94=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-amPOp7PXMOu695ctDFWF7A-1; Sun, 05 Mar 2023 16:41:02 -0500
X-MC-Unique: amPOp7PXMOu695ctDFWF7A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72E7B85D180
	for <llvm@lists.linux.dev>; Sun,  5 Mar 2023 21:41:02 +0000 (UTC)
Received: from [172.64.0.76] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61A01492C3E;
	Sun,  5 Mar 2023 21:41:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (0/5 SKIPPED): Test report for master (6.2.0,
 mainline.kernel.org-clang, f915322f)
Date: Sun, 05 Mar 2023 21:41:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <71102.123030516410200162@us-mta-517.us.mimecast.lan>
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
    Commit message: Merge tag 'v6.3-p2' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/herbert/crypto-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/76259

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/31936=
1
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/31936=
2
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/31936=
3
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/319365
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/31936=
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

