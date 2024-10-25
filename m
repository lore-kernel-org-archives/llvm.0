Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B72170A00
	for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729882934; cv=none; b=qiNYxCxBdH5oMlhz+Iu3Fkpdu17sUnwXZXC0xLZzpGiFpINt0vQGfZzI5a7dNrAiBvFysXOxQ1xJ2DtOviuvlHUcZzZtnpDBrsGsAQPSyq0hB8YUmcv4hgtnewDNW+uzJAkNVUyN7784xDhfLijB8m0SAKdxv/kv+C9Kkt6Q7CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729882934; c=relaxed/simple;
	bh=PQhxqbtKSDjtl4ud/RAaP/2fhQtmErAkcLWLKkHiFZ8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=kCW395+xOcreAzl3+gnVQz4qVei/Zq7wOiC+6NcyoStDK7HJ0F8fRXHkIDWaGqHLBYlj/fZABGKWYfBlIfWgvE2NAzaAmcfGloP5Du7BCpe1y4Snbnn1dMq03jAFlCsKu7qWvKNQv/anzNPe1JJR4vxi1YeMOF8KXzr/WnytxhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cIGooVDs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cIGooVDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729882930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4B58U5itIQ1fWvdFrcc1VHpKUPgLxN6olhVhE7STslQ=;
	b=cIGooVDsfH71oV8hkyDXojOyV5DuZYkFAy/W6Nr2pg0P+YPvbu7Z1OgEp3i4tiHJ1+zVJl
	bP5PWlrR4Gp6WYIy58lIprbiuiMtwii9bvPvUDv1vjVBMYgIM5L1vy//1bTvPeAqmCHHkN
	eYvNuLXQGpciuyUkUdZXm3ujGnr1/tQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-I__ftJvgMMSvvKQZSkVy8w-1; Fri,
 25 Oct 2024 15:02:04 -0400
X-MC-Unique: I__ftJvgMMSvvKQZSkVy8w-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 271A91955D48
	for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 19:02:03 +0000 (UTC)
Received: from [172.64.2.86] (unknown [10.30.34.59])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B85A5196BB7D;
	Fri, 25 Oct 2024 19:02:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc4,
 mainline.kernel.org-clang, b423f5a9)
Date: Fri, 25 Oct 2024 19:02:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <72491.124102515020400850@us-mta-650.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'acpi-6.12-rc5' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1512891332

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1512891332-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1512891332-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1512891332-x86_64-kernel-debug


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

