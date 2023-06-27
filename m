Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B89B1308B
	for <llvm@lists.linux.dev>; Tue, 27 Jun 2023 19:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687894269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4Y7CPvvyXZwq/5jNLfKxP6e+kWnRHp29YJX03mIJoaM=;
	b=ENKEwpVzpyyHa+6y/x7+Y6el5wezErW118j/I5mF1y/wPmxtmU+AM3Pm1L8p+pBtl8GA+n
	zbTwOc6IjupKCilwEcn2d6oFngcJGmO1Cd8rLAShPbzvJM4g65Fq0TznaA1D0hrsjuVjTb
	CqMJvKa0TRM0WlsrGcg5rFF/buJ1Zo4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-hpMo5xUCPDyKe3dNKytfJA-1; Tue, 27 Jun 2023 15:31:07 -0400
X-MC-Unique: hpMo5xUCPDyKe3dNKytfJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33352185A792
	for <llvm@lists.linux.dev>; Tue, 27 Jun 2023 19:31:07 +0000 (UTC)
Received: from [172.64.9.13] (unknown [10.30.34.230])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EA7C200A3AD;
	Tue, 27 Jun 2023 19:31:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0,
 mainline.kernel.org-clang, b19edac5)
Date: Tue, 27 Jun 2023 19:31:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <39784.123062715310702461@us-mta-210.us.mimecast.lan>
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
    Commit message: Merge tag 'nolibc.2023.06.22a' of git://git.kernel.org/=
pub/scm/linux/kernel/git/paulmck/linux-rcu

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/93843

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36635=
8


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

