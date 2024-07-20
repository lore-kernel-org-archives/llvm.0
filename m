Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBAE8BE2
	for <llvm@lists.linux.dev>; Sat, 20 Jul 2024 20:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721507533; cv=none; b=raHLqEo2t0AVStlRxP4mJlkxfNdmUIO2lRYqRiKpya5gXeoRuK1xa0u7p+sjhVm0S/4ektQFEyd0Te6QmwJRFHZ5otGTbDebB3CighXLczgk3+jJl+DAL33d6e8JbniC7ecHA61lcDTx6f6TFnLXlpDbUhV9+9aTCfUt2w+ErGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721507533; c=relaxed/simple;
	bh=1/zzmnfht6psaulZ4awBzWp8qzYV8SAb+qnD94RZ/N0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ZLJrybwgUJlBj/0R8tjErGFrD+kprKa8KkZngPMbY0mQj9fbLHmfLpmBIKTOgONeKsXPfvny7lwGQS443WgO71+auC5OYsDh1dm0M0aFnPdBtoKePZqY9OuPZC6oj2sgRQIiCv4YUpMBH6W44HlgQRw3zwp6CuCs5w6kJDGeKi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FP5TFBdN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FP5TFBdN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721507530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+9SBDw4q2I/+un6Zvx6QKgyyS7YHkAzCZzP8uWrkgx0=;
	b=FP5TFBdN7Pv7hn8hzePAf3ecWlpTliVSH09BE3QuNJC4MiHGScMR6N97Q1ZxdIfLKDLIk7
	LYsEQ3n2EScPjN4LKG+w/6ytGCpvWhb+0TVv/KKpGGeRtuEazQtG6SR80zh1mvtbcgnAAh
	+PMXRgFgU/IbiwM0X9DFsGHBLQHLz0U=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-255-c7ISqSgtMZWcGT40sTdZEg-1; Sat,
 20 Jul 2024 16:32:07 -0400
X-MC-Unique: c7ISqSgtMZWcGT40sTdZEg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6045D1956080
	for <llvm@lists.linux.dev>; Sat, 20 Jul 2024 20:32:06 +0000 (UTC)
Received: from [172.64.3.44] (unknown [10.30.33.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A78B8195605A;
	Sat, 20 Jul 2024 20:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0,
 mainline.kernel.org-clang, 8326f5e1)
Date: Sat, 20 Jul 2024 20:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <68987.124072016320700751@us-mta-255.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'firewire-updates-6.11' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/ieee1394/linux1394

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1381526639

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1381526639-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1381526639-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1381526639-x86_64-kernel-debug


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

