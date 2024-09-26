Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C81C687
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360049; cv=none; b=cbKB/7l1rW0jILGM6YwxYeOts21jgUxa2iJbNMOM6nKkOfKqTfK5o/5lx4ORx6wti26Pg4cv48GFYiKydDUCIqF1Bul4RxOxprkOcTuIxfBnl3IF3ENFUH7s6tLN4FOrioSLyDPSZECwR6MybLGKm8Q7Ae204OdIFWyQPacY2NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360049; c=relaxed/simple;
	bh=qfJDC7GaukjezrX7YVuiTsQZ+uJNTInHnyuwUQD2B2o=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=SbOd9qRxeft8JYjRwH27Ht89SkS0jSP4X5LpeEnP+aFOd9u2RmbRYUeuE95OOuY4bjITqLHLNtdnHHYiVfWxw9IDrRuou2322oaIJKkXSVJ/+0WZ5/YOmgxrLFD5CtGyj/h7suKsGDQFW3jU+VCItfqfzKUQ0TtIDv7zfEr0ZuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TSE0nogE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TSE0nogE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bdfKnV+JlPfy6/6dafv3bzebBtPhdCT/PzKhNChEzt8=;
	b=TSE0nogEy6muMAWpuK5DE18I95NOvEFWbeaJdLWT2IKt9CgLd8F2Cw6vAG0H3n1n3i2maG
	7AE+NOtEgpHU85az1xHI58P1XyiwCdT+6dVimt8ZUFAKoMGcNzqAEF4xE+zR8Y8HWHeqUu
	4K+IPCugoM8x0JQ/oESd/nOVEWxU0uw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-AIPz0GTlNp-JO6LKgC4KDA-1; Thu,
 26 Sep 2024 10:14:06 -0400
X-MC-Unique: AIPz0GTlNp-JO6LKgC4KDA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C8A718B3211
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:05 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C5C521954B0F;
	Thu, 26 Sep 2024 14:14:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 7856a565)
Date: Thu, 26 Sep 2024 14:14:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <22064.124092610140600575@us-mta-17.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'mm-nonmm-stable-2024-09-21-07-52' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/akpm/mm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1463447261

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1463447261-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1463447261-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1463447261-x86_64-kernel-debug


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

