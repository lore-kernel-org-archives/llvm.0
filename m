Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D497363
	for <llvm@lists.linux.dev>; Sat, 20 May 2023 00:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684541407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NMJ6fNcVHNecpn9E2N4EGj20fdToUrsewPjTxU9L5KI=;
	b=eTPc8HOA1DMSgRp1EEnXMXohdUgLtQ8ufmOFQEVbSJQgt0ssKMpM8JOeev5JiDwGXtbAAa
	PSP+jPoGn+bK7Eu5/Ng1i5nr+exWLG40ZTpPfXBVSNrOXZobYiIhGvaV1lNlPT7sr2mRe+
	GZdB/iKS7ZhDpheoTxrVf8qJz6+fxpQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-FRGNDNWRMHi9WjbtWGDlGQ-1; Fri, 19 May 2023 20:10:06 -0400
X-MC-Unique: FRGNDNWRMHi9WjbtWGDlGQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B670185A78E
	for <llvm@lists.linux.dev>; Sat, 20 May 2023 00:10:06 +0000 (UTC)
Received: from [172.64.15.20] (unknown [10.30.34.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AA4E40CFD45;
	Sat, 20 May 2023 00:10:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc2,
 mainline.kernel.org-clang, 5565ec4e)
Date: Sat, 20 May 2023 00:10:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <83871.123051920100600292@us-mta-436.us.mimecast.lan>
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
    Commit message: Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/=
linux/kernel/git/jejb/scsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/89584

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/35238=
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

