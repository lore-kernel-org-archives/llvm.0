Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A2213774D
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728586933; cv=none; b=qsA8PaksYkPsNuLMs6ueIyIixc9fVFlmx08jOxOo3EZLIhO0ZGWJBXW3RVUpqGfovJz6bFo0CeGWaHsMs5WtDM3VbnbKcsyVRKYlt/G9JJ0MbcelJX3dDeoccXf7n06mX5QBWroXlj9qBf6I7ldZ3y4GMzLEVEBi/DnRabHSFt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728586933; c=relaxed/simple;
	bh=F5Q2i7ZWHwYq86prJ7twddh2sbwRIvP947k4GnVFLc0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=d9buH7gHUPiB2splwQ11Qg3u8El+YjlBM8aAeoOtBC4Pnqknt7CB8vuzYjkik02KKhfpdEY6domqug1SNaI8MDSxBZ4mfkFTlrF3G6jOCtSq2qnHFDaDphtK26dBfhgJ/SqgaQgvi+glWenyrDlpBeEWuQOSNVFx+RHyTqEYiEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q7U5yzkd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q7U5yzkd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728586931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5R3vwRf29/NA0R27BiF10dkTtu4XgXPR+/+o4y4ryFA=;
	b=Q7U5yzkdzuOLS8VgcDXWFt5fOJqXEhdiisRZwdEIkekgRhcWA0b2wWJxhV7TvRPoU4Xl3F
	xM9mbLX5DWdBM6o5yfTG/hq52TsbvQuKqy7/7xISxWHQnSlHqIop0w6prRI9ihe5CadNSi
	ha7wQvk2FAhibv3YaIz9IcL/9Sq6Hkw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-113-sUvVAuERNVWKZKEBKRXH_g-1; Thu,
 10 Oct 2024 15:02:09 -0400
X-MC-Unique: sUvVAuERNVWKZKEBKRXH_g-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D05871956058
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 19:02:08 +0000 (UTC)
Received: from [172.64.0.80] (unknown [10.30.33.131])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 593AB30001A5;
	Thu, 10 Oct 2024 19:02:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc2,
 mainline.kernel.org-clang, eb952c47)
Date: Thu, 10 Oct 2024 19:02:08 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <18669.124101015020901871@us-mta-113.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-6.12-rc2-tag' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1490727380

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1490727380-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1490727380-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1490727380-x86_64-kernel-debug


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

