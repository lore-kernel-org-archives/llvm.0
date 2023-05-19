Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3681119C
	for <llvm@lists.linux.dev>; Fri, 19 May 2023 20:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684527066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dfW9bVG48YbqO03RABelgy9BBuvsi+kR0fHhqdCp6/k=;
	b=HKWxQeK+8UURx7mNfMaHQUrs9gBBhZYhQfb7C/1fm4NUAxgqFfT2ghkjw1YSVM8B8+iPRT
	MjP5eDGtFyNmT1IpDahMWgDOFn6xrv0kYPxc0FUp8ztPiw5TlhxxyqQHPajFRwDlJwekkx
	Vywfu86kncVYlvoOzbzJQjTC5GYXuTs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-y7mFDBLROOawGTk4ElQvzw-1; Fri, 19 May 2023 16:11:04 -0400
X-MC-Unique: y7mFDBLROOawGTk4ElQvzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A07D811E78
	for <llvm@lists.linux.dev>; Fri, 19 May 2023 20:11:04 +0000 (UTC)
Received: from [172.64.15.20] (unknown [10.30.34.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57F6E40D1B60;
	Fri, 19 May 2023 20:11:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc2,
 mainline.kernel.org-clang, cbd6ac38)
Date: Fri, 19 May 2023 20:11:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Message-Id: <02839.123051916110401349@us-mta-294.us.mimecast.lan>
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
    Commit message: Merge tag 'docs-6.4-fixes' of git://git.lwn.net/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/89538

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/35223=
2


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

