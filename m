Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFCD1FA26C
	for <llvm@lists.linux.dev>; Sat, 25 Jan 2025 02:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737771732; cv=none; b=ko2FICJp1xD/Jeks0e/ehYdZQE7XNbOg3fnTC0euSnJ/wzQJV+a8xYB2Sz5sIY+52kIYLpBcj8Gmu4oAYWuwtrA0Sa7xZsckkDVZJ2gXjYdFb3EwcSKIEY3Sff4OeuhZlI6X3v0OQHgaY1wt4mAI5IbjxcXmi11w54LCm2cmuZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737771732; c=relaxed/simple;
	bh=aLboQ18b2WZ7oqOCSZrZlk92babqkyKlrl9bQYB8XFc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=N0yFhECUQHNds5yfBxr5R51QDpmDWjMYBvA3f/Gknb9bQokV7L6gk4NDLPkCB0RS1SJGcBF/gutwR9wVmYcXpTbMmIcW9x0u55GHzVlFQay7i8NKNhiXsAu+RyJg61EgMp+VP5E1EodYYKNIx4mtOG6tS7Q+YbSjD7KOxulYBe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AYh1Shk6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AYh1Shk6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737771729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RZfzSPh5omJpUYsa+DCzJLi4AF3lVzeR/6VvMhAfRrA=;
	b=AYh1Shk6oK4lGTwe0p9gqXtDys3S943eKYWIuXo5ecoEUlrqn9UVLzmEsaEWP5HT9XaXnU
	mTR6Qn9PIrby5nk1Hgf9OnWVCWHL6ORGitir+ywNHzRtzz0cwJmuMKbOAsWU/Ow9nsiGRU
	5aSkTe/d015nlpHRnwk36F110jubCoU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-446-kPO9dIuuOWm-UtOauZ5mIw-1; Fri,
 24 Jan 2025 21:22:07 -0500
X-MC-Unique: kPO9dIuuOWm-UtOauZ5mIw-1
X-Mimecast-MFC-AGG-ID: kPO9dIuuOWm-UtOauZ5mIw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B7F481801F15
	for <llvm@lists.linux.dev>; Sat, 25 Jan 2025 02:22:06 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 244E4195608E;
	Sat, 25 Jan 2025 02:22:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, ae8b53aa)
Date: Sat, 25 Jan 2025 02:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <49615.125012421220800155@us-mta-446.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IwqAwPt4RGIELcjJNklyFCKZmhI_uYxiGbUZg0chP9s_1737771727
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'efi-next-for-v6.14' of git://git.kernel.org/=
pub/scm/linux/kernel/git/efi/efi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1640418824

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1640418824-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1640418824-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1640418824-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

