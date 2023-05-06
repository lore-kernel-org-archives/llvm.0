Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9BF2566
	for <llvm@lists.linux.dev>; Sat,  6 May 2023 18:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683399065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Yt9uhPwJTRVZRFqN0b+uFdgu/ArDHdi9ZIDCXUlL7QM=;
	b=eLZca7u+NxP7wAv6FNXO0tpxXBM4ojy+oTOvCbcOQgyvOeH2C+Ce0HmUp0GoMFONzkMSuD
	643X/2Yq3WE00rWoy6QIqEaz6dxxOz//0l+3wIfOA/4rbLJiFTPPOt3jSkAN2hDJsXqrGA
	bgaFgsUnNhvtsfzP+Cr6cnU67bgsE0w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-231EN9SoPnyPgHdlhi4FYA-1; Sat, 06 May 2023 14:51:04 -0400
X-MC-Unique: 231EN9SoPnyPgHdlhi4FYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCA2B280AA33
	for <llvm@lists.linux.dev>; Sat,  6 May 2023 18:51:03 +0000 (UTC)
Received: from [172.64.0.115] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB0FAC15BA0;
	Sat,  6 May 2023 18:51:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.3.0,
 mainline.kernel.org-clang, 994e2419)
Date: Sat, 06 May 2023 18:51:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <47534.123050614510400103@us-mta-403.us.mimecast.lan>
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
    Commit message: nfs: fix mis-merged __filemap_get_folio() error check

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/87510

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/34477=
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

