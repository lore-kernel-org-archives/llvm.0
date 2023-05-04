Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A819471
	for <llvm@lists.linux.dev>; Thu,  4 May 2023 23:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683241864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fNbN3r1MAhT1KPnGgzqI6/iC5ynR3kASoUnXTcR/WNM=;
	b=QnRlYUBIjqF1I+CWztqvSnZivNyfmOzI9WuuQTHM/+IdrZnQtko7gsbCcViGjPrmjMN0J5
	kkFLRvHe9szGeyK+vU4tsRiTC/Hy6XW4F3Ng7jWRh9aN6G8aoKCTjwQx8ZLGhwNvivrBDV
	6OV6sP64htG7+MSOiHEKLT0GK/OTx9Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-0f0jMxkkMSCgeYoWf_xb7w-1; Thu, 04 May 2023 19:11:02 -0400
X-MC-Unique: 0f0jMxkkMSCgeYoWf_xb7w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99C20884340
	for <llvm@lists.linux.dev>; Thu,  4 May 2023 23:11:02 +0000 (UTC)
Received: from [172.64.0.115] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8640D492B00;
	Thu,  4 May 2023 23:11:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.3.0,
 mainline.kernel.org-clang, 3c4aa443)
Date: Thu, 04 May 2023 23:11:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <05789.123050419110200421@us-mta-179.us.mimecast.lan>
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
    Commit message: Merge tag 'ceph-for-6.4-rc1' of https://github.com/ceph=
/ceph-client

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/87284

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/34400=
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

