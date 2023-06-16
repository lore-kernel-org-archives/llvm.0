Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200D97C
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 04:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686890406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UXnN/KuXJj2a1Js9cd7f90OoUMqgXlM7VmvoedrTGa0=;
	b=Pg31JeBaSYhCpM7vqumI0VUwzOWcFl+iy2Kr+6VcG1v0Hz8kj4c3ZSm9pLn//OY3tK6OOM
	wpk20Tw7oPhbx04GCJO4Kgomgc/6xpKKG5BI+cKC8LMmnuTtYVqWPKpVp0+1qGVYSZjeDZ
	fpz87f/1217RebFIbiUfZ4JnKCrKZqM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-X2mPjZLQPJ6eYZFbKcKPYw-1; Fri, 16 Jun 2023 00:40:05 -0400
X-MC-Unique: X2mPjZLQPJ6eYZFbKcKPYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 413C9810BB0
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 04:40:05 +0000 (UTC)
Received: from [172.64.4.14] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CD8A422B0;
	Fri, 16 Jun 2023 04:40:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.4.0-rc6,
 mainline.kernel.org-clang, b7feaa49)
Date: Fri, 16 Jun 2023 04:40:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Message-Id: <42953.123061600400500218@us-mta-498.us.mimecast.lan>
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
    Commit message: Merge tag 'spi-fix-v6.4-rc6' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/broonie/spi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/92737

One or more kernel builds failed:
    Unrecognized or new issues:
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/36259=
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

