

describe("Production: fandom.wikia.com", () => {
    describe("Request Recieved", () => {
        it("run promise", () => {

          const options = {
              uri: 'http://www.fandom.wikia.com',
              transform: (body) => {
                  return cheerio.load(body);
              }
          };

          rp(options)
              .then( ($) => {

                let fruits = [];

                $('li').each(function(i, elem) {
                  fruits[i] = $(this).html();
                });


                console.log(fruits);
              })
              .catch((err) => {
                  // Crawling failed or Cheerio choked...
              });

            // expect(true).to.equal(false);
        });
    });

    // describe("Hex to RGB conversion", function() {
    //     it("converts the basic colors", function() {
    //
    //     });
    // });
});
