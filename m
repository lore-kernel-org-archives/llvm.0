Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDBD4C60
	for <llvm@lists.linux.dev>; Tue, 23 May 2023 23:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684885808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lerZd+fGfDXDjqjGRBOSfcT5hKuBE4gwX15R4pWgDtg=;
	b=Z3DmnT3vudzuPgUt/MhQNLtwogM8qwMr6zwtEvlm7wcB2HRWaZZKuVzv5mnam7eYDWK3V0
	OZP0uyDVjg/mz7RcP/BsTr0T2CYiJxz6cdmJM9sSYZHX7VstY07UYJZhQf/e5iIPebULAK
	CPy+Vcsa+0W0TaN6kInpmJ8gfnG3WuE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-VywW3TQNNneDmLE1dwecTA-1; Tue, 23 May 2023 19:50:06 -0400
X-MC-Unique: VywW3TQNNneDmLE1dwecTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87441185A78B
	for <llvm@lists.linux.dev>; Tue, 23 May 2023 23:50:06 +0000 (UTC)
Received: from [172.64.14.43] (unknown [10.30.33.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 707F92029F6D;
	Tue, 23 May 2023 23:50:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc3,
 mainline.kernel.org-clang, 27e462c8)
Date: Tue, 23 May 2023 23:50:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <56207.123052319500601497@us-mta-652.us.mimecast.lan>
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
    Commit message: Merge tag 'xtensa-20230523' of https://github.com/jcmvb=
kbc/linux-xtensa

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/89994

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/35373=
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

